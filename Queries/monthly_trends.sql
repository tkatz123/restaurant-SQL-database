--Monthly Trends: explore monthly trends of restaurants

--Total orders per month
SELECT 
    STRFTIME('%Y-%m', date) AS year_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY year_month
ORDER BY year_month;

--Total revenue per month
SELECT 
    STRFTIME('%Y-%m', date) AS year_month,
    ROUND(SUM(total_order), 2) AS total_revenue
FROM orders
GROUP BY year_month
ORDER BY year_month;

--Average order value per month
SELECT 
    STRFTIME('%Y-%m', date) AS year_month,
    ROUND(AVG(total_order), 2) AS avg_order_value
FROM orders
GROUP BY year_month
ORDER BY year_month;

--Number of active members per month
SELECT 
    STRFTIME('%Y-%m', date) AS year_month,
    COUNT(DISTINCT member_id) AS active_members
FROM orders
GROUP BY year_month
ORDER BY year_month;

--Most popular meal type per month
SELECT 
    STRFTIME('%Y-%m', o.date) AS year_month,
    mt.meal_type,
    COUNT(*) AS meal_type_orders
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN meals ml ON od.meal_id = ml.meal_id
JOIN meal_types mt ON ml.meal_type_id = mt.meal_type_id
GROUP BY year_month, mt.meal_type
ORDER BY year_month, meal_type_orders DESC;