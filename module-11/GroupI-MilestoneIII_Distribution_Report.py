# Title: Milestone III distribution report
# Author: Group 1 (Robert Bean, Hunter Dale, Vanessa Espino, Seth Glover)
# Date: 10/5/2024
# Description: A distribution report that lists the total units of wine sold of each wine alongside their distributors,
# and checks to see if any of the wine isn't selling well, less than 1400 units.

import mysql.connector

db_config = {
    "user": "root",
    "password": "password", #input your password for 'password'
    "host": "127.0.0.1",
    "database": "bacchus_winery",
    "raise_on_warnings": True,
}

def generate_wine_sales_report():
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()

    try:
        query = """
        SELECT 
            w.wine_name, 
            GROUP_CONCAT(w.wine_distributor SEPARATOR ', ') AS distributors, 
            SUM(sw.units_sold) AS total_units_sold
        FROM sales_wine sw
        JOIN wine w ON sw.wine_id = w.wine_id
        GROUP BY w.wine_name
        ORDER BY total_units_sold DESC;
        """
        cursor.execute(query)
        wine_sales = cursor.fetchall()

        if wine_sales:
            print(f"{'Wine Name':<50} {'Distributors':<90} {'Total Units Sold':<25}")
            print("=" * 160)

            for row in wine_sales:
                print(f"{row[0]:<15} {row[1]:<130} {row[2]:<25}")

            least_sold_wine = min(wine_sales, key=lambda x: x[2])
            print("\nSales Performance Summary:")
            print(f"Least-Selling Wine: {least_sold_wine[0]} ({least_sold_wine[2]} units)")
            if least_sold_wine[2] < 1400:
                print(f"Warning: {least_sold_wine[0]} is not selling well. Less than 1400 units sold.")
            else:
                print("All wines are selling well above the threshold.")
        else:
            print("No sales data found.")

    except mysql.connector.Error as err:
        print(f"Database Error: {err}")

    finally:
        cursor.close()
        connection.close()

generate_wine_sales_report()


