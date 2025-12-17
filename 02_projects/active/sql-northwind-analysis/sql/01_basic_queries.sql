/*
====================================================
FILE: 01_basic_queries.sql
PROJECT: SQL Northwind Analysis
AUTHOR: Ramses Omar López Soto

PURPOSE:
Establish a solid foundation in SQL by answering
basic but business-relevant questions using the
Northwind dataset.
====================================================
*/

-- Query 1: Retrieve a clean list of customers and their geographic distribution
-- Business question: Who are our customers and in which countries do they operate?
SELECT
    customer_id,
    company_name,
    country
FROM customers
ORDER BY country, company_name;


-- Query 2: Calculate the total number of orders in the system
-- Business question: What is the overall transaction volume of the company?
SELECT
    COUNT(*) AS total_orders
FROM orders;


-- Query 3: Compute the total monetary value of each order
-- Business question: Which orders generate the highest revenue after discounts?
SELECT
    order_id,
    SUM(unit_price * quantity * (1 - discount)) AS total_amount
FROM order_details
GROUP BY order_id
ORDER BY total_amount DESC;


-- Query 4: Count the number of orders per customer
-- Business question: Which customers are the most active, and which have not placed any orders?
-- LEFT JOIN ensures customers without orders are still included
SELECT
    c.company_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.company_name
ORDER BY total_orders DESC;


-- Query 5: Identify the top-selling products by total units sold
-- Business question: Which products drive the highest sales volume?
SELECT
    p.product_name,
    SUM(od.quantity) AS total_units_sold
FROM products p
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 10;
