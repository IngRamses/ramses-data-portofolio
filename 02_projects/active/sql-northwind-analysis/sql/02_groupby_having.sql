/*
====================================================
GROUP BY & HAVING — NORTHWIND
====================================================
*/

-- 1. Total sales per customer
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

-- 2. Customers with more than 20 orders
SELECT
    c.company_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.company_name
HAVING COUNT(o.order_id) > 20
ORDER BY total_orders DESC;

-- 3. Products with low sales volume
SELECT
    p.product_name,
    SUM(od.quantity) AS total_units_sold
FROM products p
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY p.product_name
HAVING SUM(od.quantity) < 100
ORDER BY total_units_sold;
