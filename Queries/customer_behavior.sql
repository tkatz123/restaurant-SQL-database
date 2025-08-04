--Customer Behavior: Understand how members interact with platform.

--Total orders and spending per member
SELECT 
    m.member_id,
    m.first_name || ' ' || m.last_name AS member_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_order) AS total_spent
FROM members m
JOIN orders o ON m.member_id = o.member_id
GROUP BY m.member_id;


--Average order value per member
SELECT
	m.member_id,
	m.first_name || ' ' || m.last_name AS member_name,
	ROUND(AVG(o.total_order), 2) AS avg_order_value
FROM members m
JOIN orders o ON m.member_id = o.member_id
GROUP BY m.member_id;


--Memebrs who exceed their monthyl budget
SELECT 
	m.member_id,
	m.first_name || ' ' || m.last_name AS member_name,
	mmt.year,
	mmt.month,
	mmt.monthly_budget,
	mmt.total_expense
FROM members m
JOIN monthly_member_totals mmt ON m.member_id = mmt.member_id
WHERE mmt.total_expense > mmt.monthly_budget
ORDER BY mmt.total_expense - mmt.monthly_budget DESC;


--Members meal prefference 
WITH member_meals AS (
    SELECT 
        o.member_id,
        ml.hot_cold,
        mt.meal_type,
        COUNT(*) AS meal_count
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN meals ml ON od.meal_id = ml.meal_id
    JOIN meal_types mt ON ml.meal_type_id = mt.meal_type_id
    GROUP BY o.member_id, ml.hot_cold, mt.meal_type
),
ranked_meals AS (
    SELECT 
        member_id,
        hot_cold,
        meal_type,
        meal_count,
        RANK() OVER (
            PARTITION BY member_id 
            ORDER BY meal_count DESC
        ) AS rank
    FROM member_meals
)
SELECT 
    m.member_id,
    m.first_name || ' ' || m.last_name AS member_name,
    rm.hot_cold,
    rm.meal_type,
    rm.meal_count
FROM ranked_meals rm
JOIN members m ON m.member_id = rm.member_id
WHERE rm.rank = 1
ORDER BY rm.member_id;


--Top cities by active member
SELECT
	c.city,
	COUNT(DISTINCT m.member_id) AS active_members
FROM members m
JOIN cities c on m.city_id = c.city_id
JOIN orders o on m.member_id = o.member_id
GROUP BY c.city
ORDER BY active_members DESC;


