-- 🔹 1. Create Tables

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    name TEXT,
    email TEXT,
    city TEXT
);

CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    name TEXT,
    category TEXT,
    price REAL
);

CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    product_id INTEGER,
    order_date TEXT,
    quantity INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- 🔹 2. Insert Sample Data

-- Customers
INSERT INTO customers VALUES
(1, 'Vijaya', 'vijaya@email.com', 'Guntur'),
(2, 'Anil', 'anil@email.com', 'Hyderabad'),
(3, 'Swathi', 'swathi@email.com', 'Vijayawada');

-- Products
INSERT INTO products VALUES
(1, 'Laptop', 'Electronics', 50000),
(2, 'Phone', 'Electronics', 20000),
(3, 'Shoes', 'Fashion', 3000);

-- Orders
INSERT INTO orders VALUES
(1, 1, 1, '2024-12-01', 1),
(2, 2, 2, '2024-12-03', 2),
(3, 3, 3, '2025-01-05', 1),
(4, 1, 2, '2025-02-01', 1);

-- 🔹 3. SELECT Queries

-- View all customers
SELECT * FROM customers;

-- View all products
SELECT * FROM products;

-- View all orders
SELECT * FROM orders;

-- 🔹 4. WHERE & ORDER BY

-- Orders placed in 2025
SELECT * FROM orders
WHERE order_date LIKE '2025%';

-- Products ordered by price (descending)
SELECT * FROM products
ORDER BY price DESC;

-- 🔹 5. Aggregate Functions

-- Total number of orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Average product price
SELECT AVG(price) AS avg_price FROM products;

-- Maximum product price
SELECT MAX(price) AS max_price FROM products;

-- 🔹 6. GROUP BY

-- Total quantity sold per product
SELECT product_id, SUM(quantity) AS total_quantity
FROM orders
GROUP BY product_id;

-- 🔹 7. JOINS

-- Join to show orders with customer and product names
SELECT o.order_id, c.name AS customer_name, p.name AS product_name, o.order_date, o.quantity
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

-- 🔹 8. Subquery

-- Products more expensive than average price
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 🔹 9. View for Sales Summary

CREATE VIEW product_sales_summary AS
SELECT p.name AS product, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.name;

-- View the summary
SELECT * FROM product_sales_summary;

