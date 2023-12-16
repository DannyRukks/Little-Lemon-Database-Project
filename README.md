# Little-Lemon-Database-System

# Project Description
This project is part of the Meta Database Engineer Certificate course on Coursera. Little lemon is a restaurant that wants to set up a database project for business operations. Little lemon wants to build a proper database system that meets the data requirements of her business. They need a robust relational database system in MySQL to store large amounts of data which they can also easily manage and locate as required. They have decided to use MySQL Workbench to develop their new database system. To help little lemon build a relational database system, a well-structured entity relationship data model needs to be designed. Little Lemon needs help in querying and  retrieval of data from their database. The project uses MySQL for database modeling and Tableau for data visualization.
# Objective
- Set up the database in MySQL Workbench using a MySQL instance server.
- Create an entity relationship diagram and implemented in MySQL Workbench
- Commit the project. 
# Tools Used
- Mysql
- Tableau
- Python (Jupyter Notebook)
# Entity-Relationship Diagram
To begin with, an entity relationship diagram with relevant relationships that meet the data requirements of Little Lemon restaurant is created as shown below. This data model for Little is implemented in MySQL server. It contains the following tables:
- Menus
- Orders
- MenuItems
- Customers
- Employees
- Bookings

![Littlelemondb ER Diagram](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/5f8e400e-3e50-4a3d-b576-313a3b7ae0bb)

# Task instructions
Little Lemon need to create some reports on the orders placed in the restaurant. Completing the following tasks will help Little Lemon obtain the relevant information about the menu’s orders.

### Task 1
In the first task, Little Lemon needs to create a virtual table called OrdersView that focuses on OrderID, Quantity and Cost columns within the Orders table for all orders with a quantity greater than 2. This is shown below:
```
CREATE VIEW OrdersView AS 
SELECT OrderID, Quantity, TotalCost
FROM Orders
WHERE Quantity > 2;
```
### Task 2
Little Lemon need information from four tables on all customers with orders that cost more than $150. Extract the required information from each of the following tables by using the relevant JOIN clause:
```
SELECT C.CustomerID, FullName, OrderID, TotalCost, Cuisine AS MenuName, CourseName
FROM Orders O
INNER JOIN Customers C ON C.CustomerID = O.CustomerID
INNER JOIN Menu M ON M.MenuID = O.MEnuID
INNER JOIN MenuItems MS on MS.MenuItemID = M.MenuItemID
WHERE TotalCost > 150;
```
### Task 3
Little Lemon need you to find all menu items for which more than 2 orders have been placed. This task can be carried out by creating a subquery that lists the menu names from the menus table for any order quantity with more than 2.
```
SELECT Cuisine AS MenuName
FROM Menu
WHERE MenuID = ANY 
	(SELECT MenuID
	   FROM Orders
	  WHERE Quantity > 2);
```



