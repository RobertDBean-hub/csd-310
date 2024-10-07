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

-- create the manager table.... and set the foreign key
CREATE TABLE manager (
    manager_id   INT             NOT NULL        AUTO_INCREMENT,
    manager_name  VARCHAR(75)     NOT NULL,
    manager_phone   VARCHAR(75)     NOT NULL,
	manager_address  VARCHAR(75)     NOT NULL, 
    manager_email  VARCHAR(75)     NOT NULL, 
	manager_department VARCHAR(75) NOT NULL,
    PRIMARY KEY(manager_id)
);

-- create the employee table.... and set the foreign key
CREATE TABLE employee (
    employee_id   INT             NOT NULL        AUTO_INCREMENT,
    employee_name   VARCHAR(75)     NOT NULL,
    employee_phone   VARCHAR(75)     NOT NULL,
	employee_address  VARCHAR(75)     NOT NULL,  
	employee_email  VARCHAR(75),
	employee_manager VARCHAR(75) NOT NULL,
	PRIMARY KEY(employee_id)
);

-- insert wine records
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Merlot', 'Bacchus Winery', '19.99');    
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Cabernet', 'Bacchus Winery', '24.99');    
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Chablis', 'Bacchus Winery', '39.99');    
INSERT INTO wine(wine_name, wine_distributor, wine_price)
    VALUES('Merlot', 'Bacchus Winery', '39.99');
   
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
