-- Drop child tables first
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS monthly_member_totals;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS restaurants;

-- Then drop lookup/reference tables
DROP TABLE IF EXISTS serve_types;
DROP TABLE IF EXISTS meal_types;
DROP TABLE IF EXISTS restaurant_types;
DROP TABLE IF EXISTS cities;

--Drop views section
DROP VIEW IF EXISTS member_spending_summary;
DROP VIEW IF EXISTS restaurant_revenue_summary;
DROP VIEW IF EXISTS enriched_orders;