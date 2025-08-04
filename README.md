# restaurant-SQL-database

This project models and analyzes restaurant meal ordering behavior using a relational SQL database. It simulates a food delivery platform with members, restaurants, meals, and transactions. The project was developed entirely using SQLite and DB Browser for SQLite and demonstrates full-cycle data handling—from schema creation and population to advanced SQL querying and data validation.

---

## Project Structure

- `Data/`
    - Contains the raw CSV files used to populate the database tables. Each file corresponds to one table, such as `orders.csv`, `members.csv`, `meals.csv`, etc.

- `Database/`
    - Contains the SQLite database file (`restaurants_database.db`) and the `populate_tables.sql` script that loads data from the CSVs.

- `ERDs/`

    - The conceptual model (PDF diagram), which outlines the high-level entities and relationships.

    - The physical model (PDF diagram), which defines the tables, columns, and key constraints.

- `Queries/`
- Houses themed SQL query scripts demonstrating analytical capabilities and SQL fluency. Files include:

    - `customer_behavior.sql`: Analyzes member activity and spending.

    - `revenue_analysis.sql`: Examines trends in revenue and order value.

    - `meal_popularity.sql`: Identifies top-selling meals and pricing insights.

    - `restaurant_performance.sql`: Evaluates restaurant-level performance.

    - `monthly_trends.sql`: Highlights changes over time.

    - `views_and_ctes.sql`: Demonstrates the use of CTEs and reusable views.

    - `data_validation.sql`: Performs a comprehensive join across all tables to verify structural integrity.

- `Schema/`
- Contains SQL scripts for database setup:

    - `restaurants_create_tables.sql`: Creates the normalized table structure and constraints.

    - `restaurants_drop_tables.sql`: Drops all tables to reset the database.

- `Scripts/`
- Includes a Python helper script, `generate_insert_script.py`, used to convert CSV files into SQL `INSERT` statements for database loading.

---

## How to Run the Project

This project was built and tested in **DB Browser for SQLite**. To run the full database and query process, follow these steps:

1. **Open the SQLite database file**
    - Launch DB Browser for SQLite and open `restaurants_database.db` from the `Database` folder.

2. **(Optional) Reset the database**
    - Open and execute `restaurants_drop_tables.sql` from the `Schema` folder to drop existing tables if you're starting fresh.

3. **Create tables**
    - Open and execute `restaurants_create_tables.sql` to create all tables and relationships.

4. **Load the data**
    - Open and run `populate_tables.sql` from the `Database` folder. This script populates the tables using the CSV files in the `Data` folder.

5. **Commit changes**
    - In DB Browser, click “Write Changes” to save the inserted data to the database file.

6. **Run the query scripts**
    - Open the SQL files in the `Queries` folder one by one to explore and analyze the data. Each script is self-contained and themed for a specific analysis topic.

---

## Dataset Source

The dataset used in this project is publicly available on Kaggle:
[Restaurant Demand Forecasting Dataset on Kaggle](https://www.kaggle.com/datasets/vainero/restaurants-customers-orders-dataset/data)

The original dataset has been restructured and normalized into multiple related tables for use in a relational SQL context.

---

## Key Features

- Fully normalized SQL database with 10 interrelated tables

- Entity-Relationship Diagrams (conceptual and physical) for schema visualization

- End-to-end data handling: table creation, population, querying, and validation

- Themed SQL queries with joins, aggregates, common table expressions (CTEs), and views

- Validation queries to confirm referential integrity across all tables

- Clean directory structure for modular organization

---

## Author

Tyler Katz

B.S. in Applied Data Analytics, Class of 2026
Syracuse University

[GitHub Profile](https://github.com/tkatz123) • [LinkedIn](https://www.linkedin.com/in/tylerkatz1/)

---

## License

This projest is licensed under the MIT Licesne. See the LICESNE for details.