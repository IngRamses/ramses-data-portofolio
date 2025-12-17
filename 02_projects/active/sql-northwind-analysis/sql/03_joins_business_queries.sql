/*
====================================================
JOINS & BUSINESS QUESTIONS — NORTHWIND
====================================================
*/

-- 1. Orders handled by each employee
SELECT
    e.first_name || ' ' || e.last_name AS employee_name,
    COUNT(o.order_id) AS total_orders
FROM employees e
LEFT JOIN orders o
    ON e.employee_id = o.employee_id
GROUP BY employee_name
ORDER BY total_orders DESC;

-- 2. Revenue by supplier
SELECT
    s.company_name AS supplier,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_revenue
FROM suppliers s
JOIN products p
    ON s.supplier_id = p.supplier_id
JOIN order_details od
    ON p.product_id = od.product_id
GROUP BY s.company_name
ORDER BY total_revenue DESC;

-- 3. Countries with highest sales
SELECT
    c.country,
    SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
GROUP BY c.country
ORDER BY total_sales DESC;
