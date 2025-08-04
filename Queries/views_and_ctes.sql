--Creating Views and CTE's

--Drop views section (optional to run)
DROP VIEW IF EXISTS member_spending_summary;
DROP VIEW IF EXISTS restaurant_revenue_summary;
DROP VIEW IF EXISTS enriched_orders;

--View: member spending summary
CREATE VIEW member_spending_summary AS
SELECT 
    m.member_id,
    m.first_name || ' ' || m.last_name AS member_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_order), 2) AS total_spent,
    ROUND(AVG(o.total_order), 2) AS avg_order_value
FROM members m
LEFT JOIN orders o ON m.member_id = o.member_id
GROUP BY m.member_id;

--View: restaurant revenue overview
CREATE VIEW restaurant_revenue_summary AS
SELECT 
    r.restaurant_id,
    r.restaurant_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_order), 2) AS total_revenue,
    ROUND(SUM(o.total_order) * r.income_percentage, 2) AS restaurant_income
FROM restaurants r
LEFT JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id;

--CTE: top 5 members by total spending
WITH member_totals AS (
    SELECT 
        m.member_id,
        m.first_name || ' ' || m.last_name AS member_name,
        SUM(o.total_order) AS total_spent
    FROM members m
    JOIN orders o ON m.member_id = o.member_id
    GROUP BY m.member_id
)
SELECT *
FROM member_totals
ORDER BY total_spent DESC
LIMIT 5;

--CTE: monthly meal type breakdown
WITH meal_counts AS (
    SELECT 
        STRFTIME('%Y-%m', o.date) AS year_month,
        mt.meal_type,
        COUNT(*) AS total_orders
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN meals ml ON od.meal_id = ml.meal_id
    JOIN meal_types mt ON ml.meal_type_id = mt.meal_type_id
    GROUP BY year_month, mt.meal_type
)
SELECT *
FROM meal_counts
ORDER BY year_month, total_orders DESC;

--View: orders with member and restaurant info
CREATE VIEW enriched_orders AS
SELECT 
    o.order_id,
    o.date,
    o.total_order,
    m.first_name || ' ' || m.last_name AS member_name,
    r.restaurant_name,
    c.city AS restaurant_city
FROM orders o
JOIN members m ON o.member_id = m.member_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
JOIN cities c ON r.city_id = c.city_id;


SELECT * FROM member_spending_summary;

SELECT * FROM restaurant_revenue_summary;

SELECT * FROM enriched_orders;