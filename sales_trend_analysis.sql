-- STEP 1: Create the orders table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    order_date TEXT,
    amount INTEGER,
    product_id INTEGER
);

-- STEP 2: Insert sample sales data
INSERT INTO orders (order_id, order_date, amount, product_id) VALUES
(1, '2023-01-05', 550, 101),
(2, '2023-01-18', 700, 102),
(3, '2023-02-02', 680, 103),
(4, '2023-02-15', 850, 104),
(5, '2023-03-03', 900, 105),
(6, '2023-03-22', 750, 102),
(7, '2023-04-10', 1200, 106),
(8, '2023-04-28', 600, 107),
(9, '2023-05-11', 950, 108),
(10, '2023-05-29', 880, 103),
(11, '2023-06-01', 1100, 109),
(12, '2023-06-19', 720, 101),
(13, '2023-07-08', 650, 110),
(14, '2023-07-26', 700, 111),
(15, '2023-08-15', 780, 112),
(16, '2023-08-22', 820, 113),
(17, '2023-09-10', 950, 102),
(18, '2023-09-27', 1000, 105),
(19, '2023-10-03', 1100, 101),
(20, '2023-10-21', 950, 104),
(21, '2023-11-06', 720, 106),
(22, '2023-11-25', 870, 108),
(23, '2023-12-10', 950, 109),
(24, '2023-12-24', 880, 110);

-- STEP 3: Analyze monthly sales trends
SELECT
    strftime('%Y-%m', order_date) AS year_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(amount)*1.0 / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM
    orders
GROUP BY
    year_month
ORDER BY
    year_month;
