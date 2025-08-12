CREATE DATABASE Ecommerce_DB;
USE Ecommerce_DB;

-- Create the orders table
CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

-- Insert sample data
INSERT INTO orders1 (order_id, order_date, amount, product_id) VALUES
(1, '2024-01-15', 250.00, 101),
(2, '2024-01-20', 150.00, 102),
(3, '2024-02-05', 300.00, 103),
(4, '2024-02-18', 450.00, 101),
(5, '2024-03-02', 500.00, 104),
(6, '2024-03-15', 200.00, 102),
(7, '2024-03-22', 150.00, 105),
(8, '2024-04-01', 350.00, 103),
(9, '2024-04-10', 400.00, 101),
(10,'2024-04-25', 250.00, 102);

-- Extract Month from Order Date
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS month
FROM orders1;

-- Group by Year and Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month
FROM orders1
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);
    
--  Calculate Total Revenue per Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue
FROM orders1
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);
    
-- Calculate Order Volume per Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders1
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date);
    
-- 

