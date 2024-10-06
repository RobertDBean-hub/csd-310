# Title: Milestone III employee hours report
# Author: Group 1 (Robert Bean, Hunter Dale, Vanessa Espino, Seth Glover)
# Date: 10/5/2024
# Description: A employee hours report that shows all the employees with the total number of hours each have worked
# over the last four quarters.
import mysql.connector

db_config = {
    "user": "root",
    "password": "password",  # input your password for 'password'
    "host": "127.0.0.1",
    "database": "bacchus_winery",
    "raise_on_warnings": True,
}


def generate_employee_hours_report():
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()

    try:
        query = """
        SELECT 
            e.employee_name, 
            et.year_and_quarter, 
            SUM(et.employee_hours) AS total_hours_worked
        FROM employee e
        JOIN employee_time et ON e.employee_id = et.employee_id
        WHERE et.year_and_quarter IN ('2024 Q1', '2024 Q2', '2024 Q3', '2024 Q4')
        GROUP BY e.employee_name, et.year_and_quarter
        ORDER BY e.employee_name, et.year_and_quarter;
        """
        cursor.execute(query)
        employee_hours = cursor.fetchall()

        if employee_hours:
            print(f"{'Employee Name':<30} {'Quarter':<10} {'Total Hours Worked':<25}", end=' ')
            print(f"{'Employee Name':<30} {'Quarter':<10} {'Total Hours Worked':<20}")
            print("=" * 130)

            num_entries = len(employee_hours)
            half_index = (num_entries + 1) // 2

            left_column = employee_hours[:half_index]
            right_column = employee_hours[half_index:]

            for row in left_column:
                print(f"{row[0]:<30} {row[1]:<15} {row[2]:<20}", end='')

                if len(right_column) > 0:
                    right_row = right_column.pop(0)
                    print(f"{right_row[0]:<30} {right_row[1]:<15} {right_row[2]:<20}")
                else:
                    print()

            for row in right_column:
                print(f"{' ' * 30} {row[1]:<15} {row[2]:<20}")

        else:
            print("No hours data found.")

    except mysql.connector.Error as err:
        print(f"Database Error: {err}")

    finally:
        cursor.close()
        connection.close()


generate_employee_hours_report()