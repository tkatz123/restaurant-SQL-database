import pandas as pd
import os


# Define your CSV files and corresponding table names
csv_files = {
    "cities": "cities.csv",
    "restaurant_types": "restaurant_types.csv",
    "meal_types": "meal_types.csv",
    "serve_types": "serve_types.csv",
    "restaurants": "restaurants.csv",
    "members": "members.csv",
    "meals": "meals.csv",
    "orders": "orders.csv",
    "order_details": "order_details.csv",
    "monthly_member_totals": "monthly_member_totals.csv"
}

# Base path where the CSV files are located
base_path = "Data/" 

# Output SQL file path
output_file = "Database/populate_tables.sql"

# Function to safely format values for SQL
def escape_sql(value):
    if pd.isna(value):
        return "NULL"
    if isinstance(value, str):
        return "'" + value.replace("'", "''") + "'"
    return str(value)

# Build the SQL script
script_lines = ["-- SQL script to populate all tables from CSV files\n"]

for table, file_name in csv_files.items():
    file_path = os.path.join(base_path, file_name)
    if not os.path.exists(file_path):
        print(f"Warning: {file_path} not found. Skipping.")
        continue

    df = pd.read_csv(file_path)

    if table == "orders" and 'date' in df.columns:
        df['date'] = pd.to_datetime(df['date'], format='%m/%d/%y').dt.strftime('%Y-%m-%d')
    
    if df.empty:
        print(f"Note: {file_path} is empty. Skipping.")
        continue

    columns = ", ".join(df.columns)
    values_block = []

    for _, row in df.iterrows():
        values = ", ".join(escape_sql(val) for val in row)
        values_block.append(f"({values})")

    insert_block = f"INSERT INTO {table} ({columns}) VALUES\n" + ",\n".join(values_block) + ";\n"
    script_lines.append(insert_block)

# Write the SQL script to file
with open(output_file, "w") as f:
    f.write("\n".join(script_lines))

print(f"✅ SQL script generated: {output_file}")
