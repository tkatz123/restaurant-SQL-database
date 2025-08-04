--Restaurant Performance: examine the performance of restaurants

--Total orders and revenue per restaurant
SELECT 
    r.restaurant_id,
    r.restaurant_name,
    COUNT(o.order_id) AS total_orders,
    ROUND(SUM(o.total_order), 2) AS total_revenue
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id
ORDER BY total_revenue DESC;

--Average order value per restaurant
SELECT 
    r.restaurant_id,
    r.restaurant_name,
    ROUND(AVG(o.total_order), 2) AS avg_order_value
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id
ORDER BY avg_order_value DESC;

--Revenue by restaurant type
SELECT 
    rt.restaurant_type,
    ROUND(SUM(o.total_order), 2) AS total_revenue
FROM restaurant_types rt
JOIN restaurants r ON rt.restaurant_type_id = r.restaurant_type_id
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY rt.restaurant_type
ORDER BY total_revenue DESC;

--Top performing restaurants by city
SELECT 
    c.city,
    r.restaurant_name,
    ROUND(SUM(o.total_order), 2) AS total_revenue
FROM cities c
JOIN restaurants r ON c.city_id = r.city_id
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY c.city, r.restaurant_name
ORDER BY c.city, total_revenue DESC;