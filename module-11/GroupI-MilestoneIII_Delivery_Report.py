# Title: Milestone III delivery report
# Author: Group 1 (Robert Bean, Hunter Dale, Vanessa Espino, Seth Glover)
# Date: 10/4/2024
# Description: A delivery report showcasing the expected delivery and actual delivery dates, while making note of any
# significant delays

import mysql.connector
db_config = {
    "user": "root",
    "password": "password", #input your password for 'password'
    "host": "127.0.0.1",
    "database": "bacchus_winery",
    "raise_on_warnings": True,
}

def get_delivery_data():
    try:
        connection = mysql.connector.connect(**db_config)
        cursor = connection.cursor()

        cursor.execute("""
            SELECT 
                s.supplier_name,
                DATE_FORMAT(sd.scheduled_delivery, '%Y-%m-%d') AS scheduled_delivery,
                DATE_FORMAT(sd.actual_delivery, '%Y-%m-%d') AS actual_delivery,
                DATEDIFF(sd.actual_delivery, sd.scheduled_delivery) AS delivery_difference
            FROM 
                supplier_delivery sd
            JOIN 
                supplier s ON sd.supplier_id = s.supplier_id
        """)

        delivery_data = cursor.fetchall()

        if not delivery_data:
            print("No delivery data found.")
            return

        print(f"{'Supplier':<20} {'Scheduled Delivery':<20} {'Actual Delivery':<20} {'Delivery Difference (Days)':<30}")
        print("=" * 90)

        for row in delivery_data:
            supplier_name, scheduled_delivery, actual_delivery, delivery_difference = row
            print(f"{supplier_name:<20} {scheduled_delivery:<20} {actual_delivery:<20} {delivery_difference:<30}")

        analyze_delivery_performance(delivery_data)

    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        connection.close()
def analyze_delivery_performance(delivery_data):
    total_deliveries = len(delivery_data)
    on_time_deliveries = 0
    late_deliveries = 0
    significant_gap = 0

    for row in delivery_data:
        delivery_difference = row[3]
        if delivery_difference <= 0:
            on_time_deliveries += 1
        else:
            late_deliveries += 1
            if delivery_difference > 5:
                significant_gap += 1

    print("\nDelivery Performance Summary:")
    print(f"Total Deliveries: {total_deliveries}")
    print(f"On-Time Deliveries: {on_time_deliveries}")
    print(f"Late Deliveries: {late_deliveries}")
    print(f"Significant Gaps (> 5 days late): {significant_gap}")

get_delivery_data()