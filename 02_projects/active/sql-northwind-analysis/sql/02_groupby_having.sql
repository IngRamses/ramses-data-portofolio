/*
====================================================
FILE: 02_groupby_having.sql
PROJECT: SQL Northwind Analysis
AUTHOR: Ramses Omar López Soto

PURPOSE:
Demonstrate proficiency with aggregations, GROUP BY,
and HAVING clauses to segment customers and products
based on performance metrics.
====================================================
*/

-- Query 1: Calculate total sales per customer
-- Business question: Which customers contribute the most revenue?
SELECT
    c.company_name,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY c.company_name
ORDER BY total_sales DESC;


-- Query 2: Identify high-frequency customers
-- Business question: Which customers place orders frequently enough to be considered loyal?
-- HAVING is used to filter aggregated results
SELECT
    c.company_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.company_name
HAVING COUNT(o.order_id) > 20
ORDER BY total_orders DESC;


-- Query 3: Detect products with low sales volume
-- Business question: Which products may require reevaluation or discontinuation?
SELECT
    p.product_name,
    SUM(od.quantity) AS total_units_sold
FROM products p
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_name
HAVING SUM(od.quantity) < 100
ORDER BY total_units_sold;
