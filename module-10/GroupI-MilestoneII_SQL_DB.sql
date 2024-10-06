/*
    Title: Milestone II SQL Script
    Author: Group 1 (Robert Bean, Hunter Dale, Vanessa Espino, Seth Glover)

    Date: 10/01/2024
    Description: Milestone II SQL script
*/
-- drop database user if exists 
DROP USER IF EXISTS 'wine_user'@'localhost';

-- create movies_user and grant them all privileges to the movies database 
CREATE USER 'wine_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'bottles';

-- grant all privileges to the movies database to user movies_user on localhost 
GRANT ALL PRIVILEGES ON movies.* TO 'wine_user'@'localhost';

-- drop tables if they are present
DROP TABLE IF EXISTS sales_wine;
DROP TABLE IF EXISTS employee_time;
DROP TABLE IF EXISTS supplier_delivery;
DROP TABLE IF EXISTS wine;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS manager;
DROP TABLE IF EXISTS employee;

-- create the wine table 
CREATE TABLE wine (
    wine_id     INT             NOT NULL        AUTO_INCREMENT,
    wine_name   VARCHAR(75)     NOT NULL,
    wine_distributor VARCHAR(75)     NOT NULL, 
    wine_price FLOAT				NOT NULL,
     
    PRIMARY KEY(wine_id)
); 

-- create the supplier table 
CREATE TABLE supplier (
    supplier_id     INT             NOT NULL        AUTO_INCREMENT,
    supplier_name   VARCHAR(75)     NOT NULL,
    supplier_address VARCHAR(75),  
    supplier_phone VARCHAR(75)     NOT NULL,
    supplier_email VARCHAR(75)     NOT NULL,
    PRIMARY KEY(supplier_id)
); 

-- create the manager table
CREATE TABLE manager (
    manager_id   INT             NOT NULL        AUTO_INCREMENT,
    manager_name  VARCHAR(75)     NOT NULL,
    manager_phone   VARCHAR(75)     NOT NULL,
	manager_address  VARCHAR(75)     NOT NULL, 
    manager_email  VARCHAR(75)     NOT NULL, 
	manager_department VARCHAR(75) NOT NULL,
    PRIMARY KEY(manager_id)
);

-- create the employee table
CREATE TABLE employee (
    employee_id   INT             NOT NULL        AUTO_INCREMENT,
    employee_name   VARCHAR(75)     NOT NULL,
    employee_phone   VARCHAR(75)     NOT NULL,
	employee_address  VARCHAR(75)     NOT NULL,  
	employee_email  VARCHAR(75),
	employee_manager VARCHAR(75) NOT NULL,
	PRIMARY KEY(employee_id)
);

-- create the employee time table and set the foreign key
CREATE TABLE employee_time (
	time_id   INT             NOT NULL        AUTO_INCREMENT,
    employee_wage   INT             NOT NULL,
    employee_salaried    VARCHAR(75)     NOT NULL,
    employee_hours	INT,  
	year_and_quarter  VARCHAR(75)             NOT NULL,
	employee_id   INT             NOT NULL,
	PRIMARY KEY(time_id),


	CONSTRAINT fk_employee
    FOREIGN KEY(employee_id)
        REFERENCES employee(employee_id)
);

-- create the sales wine table and set the foreign key
CREATE TABLE sales_wine (
	sale_id   INT             NOT NULL        AUTO_INCREMENT,
    units_sold   INT             NOT NULL,
    sales_quarters   INT     NOT NULL,
    wine_id INT             NOT NULL,  
	PRIMARY KEY(sale_id),


	CONSTRAINT fk_wine
    FOREIGN KEY(wine_id)
        REFERENCES wine(wine_id)
);

-- create the supplier_delivery table and set the foreign key
CREATE TABLE  supplier_delivery (
	delivery_id   INT             NOT NULL        AUTO_INCREMENT,
    order_date DATE             NOT NULL,
    scheduled_delivery DATE     NOT NULL,
    actual_delivery DATE             NOT NULL,  
	supplier_id   INT             NOT NULL,
	PRIMARY KEY(delivery_id),


	CONSTRAINT fk_supplier
    FOREIGN KEY(supplier_id)
        REFERENCES supplier(supplier_id)
);

-- insert wine records
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chablis', 'ThePeak Cellars Distribution', '39.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chablis', 'TerraCellar Distributors', '39.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chablis', 'Cask & Stuff Supply Co.', '39.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chablis', 'MellowMountain Wine Partners', '39.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Cabernet', 'ThePeak Cellars Distribution', '24.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Cabernet', 'TerraCellar Distributors', '24.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Cabernet', 'Cask & Stuff Supply Co.', '24.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chardonnay', 'ThePeak Cellars Distribution', '39.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chardonnay', 'TerraCellar Distributors', '39.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chardonnay', 'Cask & Stuff Supply Co.', '39.99');
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Merlot', 'MellowMountain Wine Partners', '19.99');
   
-- insert supplier records
INSERT INTO supplier(supplier_name, supplier_address, supplier_phone, supplier_email)
    VALUES('Bottles/Corks', '5212 Utah Ave, Santa Fe, NM', '5551231333', 'orders@bottlesandcorks.com');
INSERT INTO supplier(supplier_name, supplier_address, supplier_phone, supplier_email)
    VALUES('Labels/Boxes', '3883 Moon Dr, Tampa, FL', '5551234245', 'purchases@labelsandboxes.com');
INSERT INTO supplier(supplier_name, supplier_address, supplier_phone, supplier_email)
    VALUES('Vats/Tubing', '24212 Logan Ave, Austin, TX', '5551231564', 'sales@vatsandtubing.com');

-- insert manager records 
INSERT INTO manager(manager_name, manager_phone, manager_address, manager_email, manager_department) 
    VALUES('Stan Bacchus', '5555551234', 'PO BOX 123, Indiana, US', 'Stan.Bacchus@bacchus_wines.com', 'Executive');
INSERT INTO manager(manager_name, manager_phone, manager_address, manager_email, manager_department)  
    VALUES('Davis Bacchus', '5555554322', 'PO BOX 124, Indiana, US', 'Davis.Bacchus@bacchus_wines.com', 'Executive');
INSERT INTO manager(manager_name, manager_phone, manager_address, manager_email, manager_department)  
    VALUES('Janet Collins', '5555553222', 'PO BOX 125, Indiana, US', 'Janet.Collins@bacchus_wines.com', 'Finance');
INSERT INTO manager(manager_name, manager_phone, manager_address, manager_email, manager_department)
    VALUES('Roz Murphy', '5555551236', 'PO BOX 127, Indiana, US', 'Roz.Murphy@bacchus_wines.com', 'Marketing');
INSERT INTO manager(manager_name, manager_phone, manager_address, manager_email, manager_department)
    VALUES('Maria Costanza', '5555554777', 'PO BOX 126, Indiana, US', 'Maria.Costanza@bacchus_wines.com', 'Distribution');
INSERT INTO manager(manager_name, manager_phone, manager_address, manager_email, manager_department)
    VALUES('Henry Doyle', '5555553228', 'PO BOX 128, Indiana, US', 'Henry.Doyle@bacchus_wines.com', 'Production');
    
-- insert employee records 
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Bob Ulrich', '5551231111', '122 Baker Ave, Wine City, OR', 'bob.ulrich@bacchus_wines.com', 'Roz Murphy');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Ethan Morgan', '5551231112', '123 Baker Ave, Wine City, OR', 'ethan.morgan@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Olivia Parker', '5551231113', '124 Baker Ave, Wine City, OR', 'olivia.parker@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Liam Bennett', '5551231114', '125 Baker Ave, Wine City, OR', 'liam.bennett@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Ava Harrison', '5551231115', '126 Baker Ave, Wine City, OR', 'ava.harrison@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Noah Sullivan', '5551231116', '127 Baker Ave, Wine City, OR', 'noah.sullivan@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Isabella Reed', '5551231117', '128 Baker Ave, Wine City, OR', 'isabella.reed@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Mason Carter', '5551231118', '129 Baker Ave, Wine City, OR', 'mason.carter@bacchus_wines.com', 'Henry Doyle');    
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Sophia Evans', '5551231119', '130 Baker Ave, Wine City, OR', 'sophia.evans@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Lucas Brooks', '5551231120', '131 Baker Ave, Wine City, OR', 'lucas.brooks@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Emma Turner', '5551231121', '132 Baker Ave, Wine City, OR', 'emma.turner@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Jackson Foster', '5551231122', '133 Baker Ave, Wine City, OR', 'jackson.foster@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Mia Russell', '5551231123', '134 Baker Ave, Wine City, OR', 'mia.russell@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Alexander Hayes', '5551231124', '135 Baker Ave, Wine City, OR', 'alexander.hayes@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Amelia Price', '5551231125', '136 Baker Ave, Wine City, OR', 'amelia.price@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('James Dawson', '5551231126', '137 Baker Ave, Wine City, OR', 'james.dawson@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Charlotte Miller', '5551231127', '138 Baker Ave, Wine City, OR', 'charlotte.miller@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Benjamin Cooper', '5551231128', '139 Baker Ave, Wine City, OR', 'benjamin.cooper@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Evelyn Grant', '5551231129', '140 Baker Ave, Wine City, OR', 'evelyn.grant@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Henry Roberts', '5551231130', '141 Baker Ave, Wine City, OR', 'henry.roberts@bacchus_wines.com', 'Henry Doyle');
INSERT INTO employee(employee_name, employee_phone, employee_address, employee_email, employee_manager) 
    VALUES('Grace Peterson', '5551231131', '142 Baker Ave, Wine City, OR', 'grace.peterson@bacchus_wines.com', 'Henry Doyle');


-- insert employee_time records INSERT INTO employee_time (employee_wage, employee_salaried, employee_hours, employee_id)
INSERT INTO employee_time (employee_wage, employee_salaried, employee_hours, year_and_quarter, employee_id)
SELECT '40000', 'No', '520', '2024 Q3', employee_id
FROM employee
WHERE employee_name IN (
    'Ethan Morgan', 'Olivia Parker', 'Liam Bennett', 'Ava Harrison',
    'Noah Sullivan', 'Isabella Reed', 'Mason Carter', 'Sophia Evans', 'Lucas Brooks',
    'Emma Turner', 'Jackson Foster', 'Mia Russell', 'Alexander Hayes', 'Amelia Price',
    'James Dawson', 'Charlotte Miller', 'Benjamin Cooper', 'Evelyn Grant', 'Henry Roberts',
    'Grace Peterson'
);

INSERT INTO employee_time (employee_wage, employee_salaried, employee_hours, year_and_quarter, employee_id)
SELECT '40000', 'No', '520', '2024 Q2', employee_id
FROM employee
WHERE employee_name IN (
    'Ethan Morgan', 'Olivia Parker', 'Liam Bennett', 'Ava Harrison',
    'Noah Sullivan', 'Isabella Reed', 'Mason Carter', 'Sophia Evans', 'Lucas Brooks',
    'Emma Turner', 'Jackson Foster', 'Mia Russell', 'Alexander Hayes', 'Amelia Price',
    'James Dawson', 'Charlotte Miller', 'Benjamin Cooper', 'Evelyn Grant', 'Henry Roberts',
    'Grace Peterson'
);

INSERT INTO employee_time (employee_wage, employee_salaried, employee_hours, year_and_quarter, employee_id)
SELECT '40000', 'No', '520', '2024 Q1', employee_id
FROM employee
WHERE employee_name IN (
    'Ethan Morgan', 'Olivia Parker', 'Liam Bennett', 'Ava Harrison',
    'Noah Sullivan', 'Isabella Reed', 'Mason Carter', 'Sophia Evans', 'Lucas Brooks',
    'Emma Turner', 'Jackson Foster', 'Mia Russell', 'Alexander Hayes', 'Amelia Price',
    'James Dawson', 'Charlotte Miller', 'Benjamin Cooper', 'Evelyn Grant', 'Henry Roberts',
    'Grace Peterson'
);

INSERT INTO employee_time(employee_wage, employee_salaried, employee_hours, year_and_quarter, employee_id)
	VALUES('55000', 'No', '520', '2024 Q1', (SELECT employee_id FROM employee WHERE employee_name = 'Bob Ulrich'));
INSERT INTO employee_time(employee_wage, employee_salaried, employee_hours, year_and_quarter, employee_id)
	VALUES('55000', 'No', '520', '2024 Q2', (SELECT employee_id FROM employee WHERE employee_name = 'Bob Ulrich'));    
INSERT INTO employee_time(employee_wage, employee_salaried, employee_hours, year_and_quarter, employee_id)
	VALUES('55000', 'No', '520', '2024 Q3', (SELECT employee_id FROM employee WHERE employee_name = 'Bob Ulrich'));
    

-- insert sales_wine records 
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('584', '1', (SELECT wine_id FROM wine WHERE wine_name = 'Cabernet' AND wine_distributor = 'ThePeak Cellars Distribution'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('123', '1', (SELECT wine_id FROM wine WHERE wine_name = 'Merlot' AND wine_distributor = 'MellowMountain Wine Partners'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('384', '1', (SELECT wine_id FROM wine WHERE wine_name = 'Chardonnay' AND wine_distributor = 'TerraCellar Distributors'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id)  
    VALUES('784', '1', (SELECT wine_id FROM wine WHERE wine_name = 'Chablis' AND wine_distributor = 'Cask & Stuff Supply Co.'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('584', '2', (SELECT wine_id FROM wine WHERE wine_name = 'Cabernet' AND wine_distributor = 'TerraCellar Distributors'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('123', '2', (SELECT wine_id FROM wine WHERE wine_name = 'Merlot' AND wine_distributor = 'MellowMountain Wine Partners'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('384', '2', (SELECT wine_id FROM wine WHERE wine_name = 'Chardonnay' AND wine_distributor = 'Cask & Stuff Supply Co.'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id)  
    VALUES('734', '2', (SELECT wine_id FROM wine WHERE wine_name = 'Chablis' AND wine_distributor = 'TerraCellar Distributors'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('36', '3', (SELECT wine_id FROM wine WHERE wine_name = 'Cabernet' AND wine_distributor = 'ThePeak Cellars Distribution'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('734', '3', (SELECT wine_id FROM wine WHERE wine_name = 'Merlot' AND wine_distributor = 'MellowMountain Wine Partners'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('313', '3', (SELECT wine_id FROM wine WHERE wine_name = 'Chardonnay' AND wine_distributor = 'Cask & Stuff Supply Co.'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id)  
    VALUES('713', '3', (SELECT wine_id FROM wine WHERE wine_name = 'Chablis' AND wine_distributor = 'Cask & Stuff Supply Co.'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('524', '4', (SELECT wine_id FROM wine WHERE wine_name = 'Cabernet' AND wine_distributor = 'TerraCellar Distributors'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('323', '4', (SELECT wine_id FROM wine WHERE wine_name = 'Merlot' AND wine_distributor = 'MellowMountain Wine Partners'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id) 
    VALUES('384', '4', (SELECT wine_id FROM wine WHERE wine_name = 'Chardonnay' AND wine_distributor = 'Cask & Stuff Supply Co.'));
INSERT INTO sales_wine(units_sold, sales_quarters, wine_id)  
    VALUES('984', '4', (SELECT wine_id FROM wine WHERE wine_name = 'Chablis' AND wine_distributor = 'Cask & Stuff Supply Co.'));

    
-- insert supplier_delivery records 
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2024-01-01', '2024-01-15', '2024-01-17',(SELECT supplier_id FROM supplier WHERE supplier_name = 'Bottles/Corks'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2024-01-01', '2024-01-15', '2024-01-17',(SELECT supplier_id FROM supplier WHERE supplier_name = 'Labels/Boxes'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2024-01-01', '2024-01-15', '2024-02-17',(SELECT supplier_id FROM supplier WHERE supplier_name = 'Vats/Tubing'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2024-02-01', '2024-02-15', '2024-02-17',(SELECT supplier_id FROM supplier WHERE supplier_name = 'Bottles/Corks'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2024-04-01', '2024-04-15', '2024-04-17',(SELECT supplier_id FROM supplier WHERE supplier_name = 'Labels/Boxes'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2024-03-01', '2024-03-15', '2024-03-17',(SELECT supplier_id FROM supplier WHERE supplier_name = 'Vats/Tubing'));
    INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-10-10', '2023-10-15', '2023-10-15', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Bottles/Corks'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-02-10', '2023-02-15', '2023-02-15', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Bottles/Corks'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-07-01', '2023-07-05', '2023-07-05', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Bottles/Corks'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-03-05', '2023-03-10', '2023-03-10', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Labels/Boxes'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-08-20', '2023-08-25', '2023-08-28', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Labels/Boxes')); 
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-06-15', '2023-06-20', '2023-06-20', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Labels/Boxes'));    
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-04-12', '2023-04-17', '2023-04-17', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Vats/Tubing'));
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-05-18', '2023-05-23', '2023-05-26', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Vats/Tubing')); 
INSERT INTO supplier_delivery(order_date, scheduled_delivery, actual_delivery, supplier_id)
    VALUES('2023-09-01', '2023-09-06', '2023-09-06', (SELECT supplier_id FROM supplier WHERE supplier_name = 'Vats/Tubing'));