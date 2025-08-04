--Meal Popularity: explores top-selling meals and restaurant level performance

-- Top 10 most ordered meals
SELECT 
    ml.meal_name,
    COUNT(*) AS total_orders
FROM order_details od
JOIN meals ml ON od.meal_id = ml.meal_id
GROUP BY ml.meal_name
ORDER BY total_orders DESC
LIMIT 10;

--Top meal types by total orders
SELECT 
    mt.meal_type,
    COUNT(*) AS total_orders
FROM order_details od
JOIN meals ml ON od.meal_id = ml.meal_id
JOIN meal_types mt ON ml.meal_type_id = mt.meal_type_id
GROUP BY mt.meal_type
ORDER BY total_orders DESC;

--Most popular meals by serve type (hot/cold)
SELECT 
    ml.hot_cold,
    ml.meal_name,
    COUNT(*) AS total_orders
FROM order_details od
JOIN meals ml ON od.meal_id = ml.meal_id
GROUP BY ml.hot_cold, ml.meal_name
ORDER BY ml.hot_cold, total_orders DESC;

--Meal popularity by price range
SELECT 
    CASE 
        WHEN ml.price < 30 THEN 'Under $30'
        WHEN ml.price BETWEEN 30 AND 60 THEN '$30 - $60'
        ELSE 'Above $60'
    END AS price_range,
    COUNT(*) AS total_orders
FROM order_details od
JOIN meals ml ON od.meal_id = ml.meal_id
GROUP BY price_range
ORDER BY total_orders DESC;

--Top 5 restaurants by total meal orders
SELECT 
    r.restaurant_name,
    COUNT(*) AS total_orders
FROM order_details od
JOIN meals ml ON od.meal_id = ml.meal_id
JOIN restaurants r ON ml.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_orders DESC
LIMIT 5;