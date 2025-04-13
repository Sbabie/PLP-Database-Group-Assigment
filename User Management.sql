CREATE ROLE 'bookstore_admin';
GRANT ALL PRIVILEGES ON bookstore.* TO 'bookstore_admin';

CREATE ROLE 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON bookstore.customer TO 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON bookstore.customer_address TO 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON bookstore.cust_order TO 'bookstore_sales';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'bookstore_sales';
GRANT SELECT, INSERT ON bookstore.order_history TO 'bookstore_sales';
GRANT SELECT ON bookstore.book TO 'bookstore_sales';
GRANT SELECT ON bookstore.author TO 'bookstore_sales';
GRANT SELECT ON bookstore.publisher TO 'bookstore_sales';
GRANT SELECT ON bookstore.address TO 'bookstore_sales';
GRANT SELECT ON bookstore.country TO 'bookstore_sales';
GRANT SELECT ON bookstore.address_status TO 'bookstore_sales';
GRANT SELECT ON bookstore.order_status TO 'bookstore_sales';
GRANT SELECT ON bookstore.shipping_method TO 'bookstore_sales';

CREATE ROLE 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.book TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore.book_author TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE ON bookstore.author TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE ON bookstore.publisher TO 'bookstore_inventory';
GRANT SELECT, INSERT, UPDATE ON bookstore.book_language TO 'bookstore_inventory';
GRANT SELECT ON bookstore.order_line TO 'bookstore_inventory';

CREATE ROLE 'bookstore_shipping';
GRANT SELECT ON bookstore.cust_order TO 'bookstore_shipping';
GRANT SELECT ON bookstore.order_line TO 'bookstore_shipping';
GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'bookstore_shipping';
GRANT SELECT ON bookstore.customer TO 'bookstore_shipping';
GRANT SELECT ON bookstore.address TO 'bookstore_shipping';
GRANT SELECT ON bookstore.shipping_method TO 'bookstore_shipping';
GRANT SELECT ON bookstore.order_status TO 'bookstore_shipping';

CREATE ROLE 'bookstore_analyst';
GRANT SELECT ON bookstore.* TO 'bookstore_analyst';

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'bookstore_password';
GRANT 'bookstore_admin' TO 'admin_user'@'localhost';

CREATE USER 'sales_user'@'localhost' IDENTIFIED BY 'bookstore_password';
GRANT 'bookstore_sales' TO 'sales_user'@'localhost';

CREATE USER 'inventory_user'@'localhost' IDENTIFIED BY 'bookstore_password';
GRANT 'bookstore_inventory' TO 'inventory_user'@'localhost';

CREATE USER 'shipping_user'@'localhost' IDENTIFIED BY 'bookstore_password';
GRANT 'bookstore_shipping' TO 'shipping_user'@'localhost';

CREATE USER 'analyst_user'@'localhost' IDENTIFIED BY 'bookstore_password';
GRANT 'bookstore_analyst' TO 'analyst_user'@'localhost';

SET DEFAULT ROLE ALL TO
  'admin_user'@'localhost',
  'sales_user'@'localhost',
  'inventory_user'@'localhost',
  'shipping_user'@'localhost',
  'analyst_user'@'localhost';
