-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2025-08-02 22:48:48.126

-- tables
-- Table: cities
CREATE TABLE cities (
    city_id integer NOT NULL CONSTRAINT cities_pk PRIMARY KEY,
    city varchar(25)
);

-- Table: meal_types
CREATE TABLE meal_types (
    meal_type_id integer NOT NULL CONSTRAINT meal_types_pk PRIMARY KEY,
    meal_type varchar(10) NOT NULL
);

-- Table: meals
CREATE TABLE meals (
    meal_id integer NOT NULL CONSTRAINT meals_pk PRIMARY KEY,
    hot_cold varchar(10) NOT NULL,
    meal_name varchar(25) NOT NULL,
    price decimal(4,2) NOT NULL,
    serve_type_id integer NOT NULL,
    meal_type_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    CONSTRAINT meals_meal_types FOREIGN KEY (meal_type_id)
    REFERENCES meal_types (meal_type_id),
    CONSTRAINT meals_serve_types FOREIGN KEY (serve_type_id)
    REFERENCES serve_types (serve_type_id),
    CONSTRAINT meals_restaurants FOREIGN KEY (restaurant_id)
    REFERENCES restaurants (restaurant_id)
);

-- Table: members
CREATE TABLE members (
    member_id integer NOT NULL CONSTRAINT members_pk PRIMARY KEY,
    first_name varchar(25) NOT NULL,
    last_name varchar(25) NOT NULL,
    sex varchar(1) NOT NULL,
    email varchar(50) NOT NULL,
    city_id integer NOT NULL,
    CONSTRAINT members_cities FOREIGN KEY (city_id)
    REFERENCES cities (city_id)
);

-- Table: monthly_member_totals
CREATE TABLE monthly_member_totals (
    member_id integer NOT NULL,
    year integer NOT NULL,
    month integer NOT NULL,
    order_count integer NOT NULL,
    meals_count integer NOT NULL,
    monthly_budget decimal(6,2) NOT NULL,
    total_expense integer NOT NULL,
    balance decimal(6,2) NOT NULL,
    commission decimal(10,6) NOT NULL,
    CONSTRAINT monthly_member_totals_members FOREIGN KEY (member_id)
    REFERENCES members (member_id),
	CONSTRAINT monthly_member_totals_pk PRIMARY KEY (member_id, year, month)
);

-- Table: order_details
CREATE TABLE order_details (
    order_details_id integer NOT NULL CONSTRAINT order_details_pk PRIMARY KEY,
    order_id integer NOT NULL,
    meal_id integer NOT NULL,
    CONSTRAINT order_details_meals FOREIGN KEY (meal_id)
    REFERENCES meals (meal_id),
    CONSTRAINT order_details_orders FOREIGN KEY (order_id)
    REFERENCES orders (order_id)
);

-- Table: orders
CREATE TABLE orders (
    order_id integer NOT NULL CONSTRAINT orders_pk PRIMARY KEY,
    date date NOT NULL,
    hour datetime NOT NULL,
    total_order decimal(5,2) NOT NULL,
    member_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    CONSTRAINT orders_members FOREIGN KEY (member_id)
    REFERENCES members (member_id),
    CONSTRAINT orders_restaurants FOREIGN KEY (restaurant_id)
    REFERENCES restaurants (restaurant_id)
);

-- Table: restaurant_type
CREATE TABLE restaurant_types (
    restaurant_type_id integer NOT NULL CONSTRAINT restaurant_type_pk PRIMARY KEY,
    restaurant_type varchar(25) NOT NULL
);

-- Table: restaurants
CREATE TABLE restaurants (
    restaurant_id integer NOT NULL CONSTRAINT restaurants_pk PRIMARY KEY,
    restaurant_name varchar(25) NOT NULL,
    income_percentage decimal(4,3) NOT NULL,
    restaurant_type_id integer NOT NULL,
    city_id integer NOT NULL,
    CONSTRAINT restaurants_cities FOREIGN KEY (city_id)
    REFERENCES cities (city_id),
    CONSTRAINT restaurants_restaurant_type FOREIGN KEY (restaurant_type_id)
    REFERENCES restaurant_types (restaurant_type_id)
);

-- Table: serve_types
CREATE TABLE serve_types (
    serve_type_id integer NOT NULL CONSTRAINT serve_types_pk PRIMARY KEY,
    serve_type varchar(10) NOT NULL
);

-- End of file.

