--Data Validation

--Full data validation query joining all 10 tables in database
SELECT 
    od.order_details_id,
    o.date,
    o.hour,
    m.first_name || ' ' || m.last_name AS member_name,
    ct.city,
    ml.meal_name,
    mt.meal_type,
    st.serve_type,
    r.restaurant_name,
    rt.restaurant_type,
    o.total_order,
    ml.price,
	m.member_id,
    mmt.year,
    mmt.month,
    mmt.order_count,
    mmt.meals_count,
    mmt.monthly_budget,
    mmt.total_expense,
    mmt.balance,
    mmt.commission
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN members m ON o.member_id = m.member_id
JOIN cities ct ON m.city_id = ct.city_id
JOIN meals ml ON od.meal_id = ml.meal_id
JOIN meal_types mt ON ml.meal_type_id = mt.meal_type_id
JOIN serve_types st ON ml.serve_type_id = st.serve_type_id
JOIN restaurants r ON ml.restaurant_id = r.restaurant_id
JOIN restaurant_types rt ON r.restaurant_type_id = rt.restaurant_type_id
JOIN monthly_member_totals mmt 
    ON mmt.member_id = m.member_id