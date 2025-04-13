USE bookstore;
INSERT INTO country (country_name, country_code) VALUES
('Kenya', 'KE'),
('United Kingdom', 'UK'),
('Canada', 'CA'),
('Australia', 'AU'),
('Germany', 'DE');

INSERT INTO book_language (language_code, language_name) VALUES
('en', 'English'),
('es', 'Spanish'),
('fr', 'French'),
('de', 'German'),
('zh', 'Chinese');
INSERT INTO publisher (publisher_name, publisher_email, publisher_phone) VALUES
('Longhorn House', 'info@longhornhouse.com', '0701456433'),
('HarperCollins', 'contact@harpercollins.com', '0745276378'),
('Hachette Book Group', 'info@hachettebookgroup.com', '0734678965');

INSERT INTO author (author_first_name, author_last_name, author_bio) VALUES
('J.K.', 'Rowling', 'British author best known for the Harry Potter series.'),
('Stephen', 'King', 'American author of horror, supernatural fiction, suspense, and fantasy novels.'),
('Agatha', 'Christie', 'English writer known for her detective novels.'),
('Ernest', 'Hemingway', 'American novelist, short-story writer, and journalist.'),
('Jane', 'Austen', 'English novelist known primarily for her six major novels.');
INSERT INTO address_status (address_status_name) VALUES
('Current'),
('Previous'),
('Shipping'),
('Billing'),
('Business');
INSERT INTO order_status (status_name) VALUES
('Pending'),
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled');

INSERT INTO shipping_method (method_name, cost) VALUES
('Standard Shipping', 500),
('Express Shipping', 600),
('Next Day Delivery', 700),
('International Shipping', 800),
('In-Store Pickup', 800);

INSERT INTO address (street_number, street_name, city, state_province, postal_code, country_id) VALUES
('123', 'Moi St', 'Nairobi', 'NBO', '10001', 1),
('456', 'Parklands Ave', 'Nakuru', 'NA', '90001', 1),
('789', 'Tom Mboya St', 'Uganda', 'UG', 'M5H 2N2', 3);

INSERT INTO book (title, isbn, publication_date, price, publisher_id, language_id, page_count, description) VALUES
('The Great Gatsby', '9780743273565', '2004-09-30', 1299, 3, 1, 180, 'A novel of the Jazz Age by F. Scott Fitzgerald.'),
('To Kill a Mockingbird', '9780061120084', '2006-05-23', 1499, 2, 1, 336, 'A novel by Harper Lee published in 1960.'),
('1984', '9780451524935', '1950-07-01', 999, 1, 1, 328, 'A dystopian novel by George Orwell.');

INSERT INTO customer (first_name, last_name, email, phone, registration_date) VALUES
('John', 'Simiyu', 'john.smith@example.com', '0700345678', '2023-01-15 10:30:00'),
('Emily', 'Juma', 'emily.j@example.com', '0789535365', '2023-02-20 14:45:00'),
('Michael', 'Bole', 'michael.b@example.com', '0712556562', '2023-03-10 09:15:00');
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1), -- John Simiyu's current address
(2, 2, 1), -- Emily Juma's current address
(3, 3, 1), -- Michael Bole's current address

INSERT INTO book_author (book_id, author_id) VALUES
(4, 5), -- Pride and Prejudice by Jane Austen
(1, 4), -- The Great Gatsby (assuming author_id 4 is appropriate for demonstration)
(2, 3), -- To Kill a Mockingbird (assuming author_id 3 is appropriate for demonstration)
(3, 2), -- 1984 (assuming author_id 2 is appropriate for demonstration)
(5, 1); -- The Hobbit (assuming author_id 1 is appropriate for demonstration)

INSERT INTO cust_order (customer_id, order_date, shipping_address_id, shipping_method_id, order_total) VALUES
(1, '2023-06-10 09:30:00', 1, 1, 2798),
(2, '2023-06-15 14:20:00', 2, 2, 1499),
(3, '2023-06-20 11:45:00', 3, 3, 3697);

INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 1299), -- John ordered The Great Gatsby
(1, 2, 1, 1499), -- John also ordered To Kill a Mockingbird
(2, 3, 1, 999),  -- Emily ordered 1984


INSERT INTO order_history (order_id, status_id, status_date, notes) VALUES
(1, 1, '2023-06-10 09:30:00', 'Order placed online'),
(1, 2, '2023-06-11 10:15:00', 'Payment confirmed'),
(1, 3, '2023-06-12 14:30:00', 'Order shipped via USPS'),
(2, 1, '2023-06-15 14:20:00', 'Order placed by phone'),
(2, 2, '2023-06-16 09:45:00', 'Processing order'),
(3, 1, '2023-06-20 11:45:00', 'Order placed online'),
(3, 2, '2023-06-21 13:20:00', 'Payment confirmed'),
(4, 1, '2023-06-25 16:10:00', 'Order placed online'),
(4, 5, '2023-06-26 10:30:00', 'Customer cancelled order'),
(5, 1, '2023-06-30 10:05:00', 'Order placed in store'),
(5, 3, '2023-06-30 17:15:00', 'Order shipped same day');
