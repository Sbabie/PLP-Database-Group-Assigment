-- ========================
-- Authors
-- ========================
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    bio TEXT
);

-- =========================
-- Books
-- =========================
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    tittle VARCHAR(50),
    genre VARCHAR(50),
    price DECIMAL(10.2),
    stock_quantity INT DEFAULT 0,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- ==========================
-- CUSTOMERS
-- ==========================
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(20)
);

-- ============================
-- ORDERS
-- ============================
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- ===============================
-- ORDER_DETAILS
-- ===============================
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price_each DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- ================================
-- SHIPPING
-- ================================
CREATE TABLE shipping (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    shipping_address VARCHAR(255),
    shipping_date DATE,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (orde_id) REFERENCES orders(order_id),
    );

-- Create users
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'readonlypass';
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'adminpass';

-- Grant permissions
GRANT SELECT ON bookstore.* TO 'readonly_user'@'localhost';
GRANT ALL PRIVILEGES ON bookstore.* TO 'admin_user'@'localhost';

-- Apply changes
FLUSH PRIVILEGES;

SELECT SUM(stock_quantity) AS total_books FROM books;

SELECT o.order_id, o.order_date, o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.email = 'customer@example.com';

SELECT b.title, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN books b ON od.book_id = b.book_id
GROUP BY b.title
ORDER BY total_sold DESC
LIMIT 5;
