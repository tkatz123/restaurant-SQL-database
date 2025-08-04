-- Revenue Analysis: Explore restauranat revenue trends and patterns

--Total Revenue Per Restaurant
SELECT 
	r.restaurant_name, 
	ROUND(SUM(o.total_order), 2) AS total_revenue
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id
ORDER BY total_revenue DESC;
	
-- Average revenue per order by restaurant
SELECT
	r.restaurant_name,
	ROUND(AVG(o.total_order), 2) AS avg_order_value
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id
ORDER BY avg_order_value DESC;

--Monthly revenue trend for all restaurants
SELECT 
    STRFTIME('%Y-%m', o.date) AS year_month,
    ROUND(SUM(o.total_order), 2) AS total_monthly_revenue
FROM orders o
GROUP BY year_month
ORDER BY year_month;

--Top earning cities
SELECT 
    c.city,
    ROUND(SUM(o.total_order), 2) AS city_revenue
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
JOIN cities c ON r.city_id = c.city_id
GROUP BY c.city
ORDER BY city_revenue DESC;

--Most profitable meal types
SELECT 
    mt.meal_type,
    ROUND(SUM(ml.price), 2) AS total_meal_revenue
FROM order_details od
JOIN meals ml ON od.meal_id = ml.meal_id
JOIN meal_types mt ON ml.meal_type_id = mt.meal_type_id
GROUP BY mt.meal_type
ORDER BY total_meal_revenue DESC;

--Revenue contribution by restaurant type
SELECT 
    rt.restaurant_type,
    ROUND(SUM(o.total_order), 2) AS revenue_by_type
FROM orders o
JOIN restaurants r ON o.restaurant_id = r.restaurant_id
JOIN restaurant_types rt ON r.restaurant_type_id = rt.restaurant_type_id
GROUP BY rt.restaurant_type
ORDER BY revenue_by_type DESC;

--Commission earned per member
SELECT 
    m.first_name || ' ' || m.last_name AS member_name,
    ROUND(SUM(mmt.commission), 2) AS total_commission
FROM monthly_member_totals mmt
JOIN members m ON mmt.member_id = m.member_id
GROUP BY mmt.member_id
ORDER BY total_commission DESC;
	