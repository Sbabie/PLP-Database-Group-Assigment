-- Test queries for the BookStore database
USE bookstore;

-- 1. Find all books and their authors
SELECT b.title, 
       b.isbn, 
       CONCAT(a.author_first_name, ' ', a.author_last_name) AS author_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
ORDER BY b.title;

-- 2. Get total sales by book
SELECT b.title, 
       COUNT(ol.line_id) AS times_ordered,
       SUM(ol.quantity) AS total_copies_sold,
       SUM(ol.quantity * ol.price) AS total_revenue
FROM book b
LEFT JOIN order_line ol ON b.book_id = ol.book_id
GROUP BY b.title
ORDER BY total_revenue DESC;

-- 3. Get customer order history with status
SELECT c.first_name, 
       c.last_name, 
       co.order_id,
       co.order_date,
       os.status_name AS current_status,
       co.order_total
FROM customer c
JOIN cust_order co ON c.customer_id = co.customer_id
JOIN order_history oh ON co.order_id = oh.order_id
JOIN order_status os ON oh.status_id = os.status_id
WHERE oh.history_id = (
    SELECT MAX(history_id) 
    FROM order_history 
    WHERE order_id = co.order_id
)
ORDER BY co.order_date DESC;

-- 4. Find books by language and publisher
SELECT b.title, 
       b.publication_date,
       bl.language_name,
       p.publisher_name
FROM book b
JOIN book_language bl ON b.language_id = bl.language_id
JOIN publisher p ON b.publisher_id = p.publisher_id
WHERE bl.language_name = 'English'
ORDER BY p.publisher_name, b.title;

-- 5. Calculate shipping costs by method
SELECT sm.method_name,
       COUNT(co.order_id) AS number_of_orders,
       SUM(sm.cost) AS total_shipping_cost
FROM shipping_method sm
LEFT JOIN cust_order co ON sm.method_id = co.shipping_method_id
GROUP BY sm.method_name
ORDER BY number_of_orders DESC;

-- 6. Find customers with multiple addresses
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       COUNT(ca.address_id) AS number_of_addresses
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
GROUP BY c.customer_id
HAVING COUNT(ca.address_id) > 1;

-- 7. Find books that have never been ordered
SELECT b.book_id,
       b.title,
       b.isbn
FROM book b
LEFT JOIN order_line ol ON b.book_id = ol.book_id
WHERE ol.line_id IS NULL;

-- 8. Find the most recent order for each customer
SELECT c.customer_id,
       c.first_name,
       c.last_name,
       MAX(co.order_date) AS most_recent_order
FROM customer c
LEFT JOIN cust_order co ON c.customer_id = co.customer_id
GROUP BY c.customer_id;

-- 9. Get detailed order information including books and shipping
SELECT co.order_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       co.order_date,
       b.title,
       ol.quantity,
       ol.price,
       sm.method_name AS shipping_method,
       CONCAT(a.street_number, ' ', a.street_name, ', ', a.city, ', ', a.state_province, ' ', a.postal_code, ', ', cn.country_name) AS shipping_address,
       os.status_name AS current_status
FROM cust_order co
JOIN customer c ON co.customer_id = c.customer_id
JOIN order_line ol ON co.order_id = ol.order_id
JOIN book b ON ol.book_id = b.book_id
JOIN shipping_method sm ON co.shipping_method_id = sm.method_id
JOIN address a ON co.shipping_address_id = a.address_id
JOIN country cn ON a.country_id = cn.country_id
JOIN order_history oh ON co.order_id = oh.order_id
JOIN order_status os ON oh.status_id = os.status_id
WHERE oh.history_id = (
    SELECT MAX(history_id) 
    FROM order_history 
    WHERE order_id = co.order_id
)
ORDER BY co.order_date DESC;

