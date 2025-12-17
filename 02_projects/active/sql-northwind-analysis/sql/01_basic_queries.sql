/*
====================================================
SQL BASIC QUERIES — NORTHWIND
Author: Ramses Omar López Soto
Objective: Practice core SQL skills using business-style queries
====================================================
*/

-- 1. List all customers
SELECT
    customer_id,
    company_name,
    country
FROM customers
ORDER BY country, company_name;

-- 2. Count total number of orders
SELECT
    COUNT(*) AS total_orders
FROM orders;

-- 3. Total sales amount per order
SELECT
    order_id,
    SUM(unit_price * quantity * (1 - discount)) AS total_amount
FROM order_details
GROUP BY order_id
ORDER BY total_amount DESC;

-- 4. Orders per customer
SELECT
    c.company_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.company_name
ORDER BY total_orders DESC;

-- 5. Top 10 products by units sold
SELECT
    p.product_name,
    SUM(od.quantity) AS total_units_sold
FROM products p
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 10;
