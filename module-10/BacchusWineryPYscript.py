import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "root",
    "password": "XboxLive01!!",
    "host": "127.0.0.1",
    "database": "bacchus_winery",
    "raise_on_warnings": True
}

try:
    db = mysql.connector.connect(**config)
    print("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"], config["database"]))
    input("\n\n Press any key to continue...")

    cursor = db.cursor()
    cursor.execute('SELECT * from wine')
    wine = cursor.fetchall()
    for name in wine:
        print("Wine ID: {}\n Wine Name: {}\n Wine Distributor: {}\n Wine Price {}\n".format(name[0], name[1], name[2], name[3]))

        cursor = db.cursor()
    cursor.execute('SELECT * from supplier')
    supplier = cursor.fetchall()
    for name in supplier:
        print("Supplier ID: {}\n Supplier Name: {}\n Supplier Address: {}\n Supplier Phone: {}\n Supplier Email: ".format(name[0], name[1], name[2], name[3], name[4]))
    
        cursor = db.cursor()
    cursor.execute('SELECT * from manager')
    manager = cursor.fetchall()
    for name in manager:
        print("Manager ID: {}\n Manager Name: {}\n Manager Phone: {}\n Manager Address: {}\n Manager Email: {}\n Manager Department: {}\n".format(name[0], name[1], name[2], name[3], name[4], name[5]))
    
        cursor = db.cursor()
    cursor.execute('SELECT * from employee')
    employee = cursor.fetchall()
    for name in employee:
        print("Employee ID: {}\n Employee Name: {}\n Employee Phone: {}\n Employee Address: {}\n Employee Email: {}\n Employee Manager: {}\n".format(name[0], name[1], name[2], name[3], name[4], name[5]))

 
    

    

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("  The supplied username or password are invalid")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("  The specified database does not exist")
    else:
        print(err)
finally:
    db.close()