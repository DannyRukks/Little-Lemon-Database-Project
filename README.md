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
![Task 1 Result of Orderviews](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/c4fe1de4-06f7-44fe-934a-cfe3291c87c4)

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
![Task 2 Result of Joins](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/48d5c52c-d89d-4bd7-b8bf-6f4ad2bee152)

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
![Task 3 Result of ANY Subquery](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/e244b9d1-6479-4126-824f-2f25ded96adc)

### Task 4
Little Lemon needs to create a procedure that displays the maximum ordered quantity in the Orders table. Creating this procedure will allow Little Lemon to reuse the logic implemented in the procedure easily without retyping the same code over again and again to check the maximum quantity.
```
CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) AS "Max Quantity in Order"
  FROM Orders;
```
![Task 4 Result of GetMaxQuantity Procedure](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/c52eb537-e729-4ad3-b447-a1e703713462)

### Task 5
Little Lemon needs to help them to create a prepared statement called GetOrderDetail. This prepared statement will help to reduce the parsing time of queries. It will also help to secure the database from SQL injections.
```
PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost
  FROm Orders
  WHERE CustomerID = ?';
  
SET @Customer_ID = 2;
EXECUTE GetOrderDetail USING @Customer_ID;
```
![Task 5 GetOrderDetail PrepareStatement](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/8f22e1fa-d5bc-4e6b-a738-e504445cff6b)

### Task 6
Create a stored procedure called CancelOrder. Little Lemon want to use this stored procedure to delete an order record based on the user input of the order id. Creating this procedure will allow Little Lemon to cancel any order by specifying the order id value in the procedure parameter without typing the entire SQL delete statement.   
```
DELIMITER //
CREATE PROCEDURE CancelOrder(Order_id int)
BEGIN
DELETE FROM
Orders
WHERE Orderid = Order_id;
SELECT CONCAT("Order ", Order_id, " is cancelled") AS Confirmation
FROM Orders;
END //
DELIMITER ;
```
![Task 6 CancelOrder Procedure result](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/0b28e4bc-8d36-49ff-a9a8-8b336ba5a2fc)

### Task 7
Little Lemon wants to populate the Bookings table of their database with some records of data. The task is to replicate the list of records in the following table by adding them to the Little Lemon booking table.
```
INSERT INTO bookings (BookingID, BookingDate, TableNumber, CustomerID)
values
(1, "2022-10-10", 5, 1),
(2, "2022-11-12", 3, 3),
(3, "2022-10-11", 2, 2),
(4, "2022-10-13", 2, 1);
```
![Task 7 Insert into Booking Table Result](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/58f9815a-ac44-4e27-90fd-16d8b2678704)

### Task 8
Little Lemon needs to create a stored procedure called CheckBooking to check whether a table in the restaurant is already booked. Creating this procedure helps to minimize the effort involved in repeatedly coding the same SQL statements. The procedure should have two input parameters in the form of booking date and table number.
```
DELIMITER //
CREATE PROCEDURE CheckBooking(Booking_date Date, Table_Number INT)
BEGIN
SELECT CONCAT("Table ", Table_Number, " is already booked") AS "Booking Status"
  FROM Bookings;  
END //
DELIMITER ;
CALL CheckBooking("2022-10-10", 1);
```
![Task 8 Result of checkbooking Procedure](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/92be455b-1c28-42d5-82e2-1b2ae293845c)

### Task 9
Little Lemon need you to create a new procedure called AddBooking to add a new table booking record. The procedure should include four input parameters in the form of the following bookings parameters: booking id, customer id, booking date and table number.
```
CREATE PROCEDURE AddBooking(Booking_id INT, Booking_date Date, Table_Number INT, Customer_ID INT)
BEGIN
INSERT INTO bookings(BookingID, BookingDate, TableNumber, CustomerID)
VALUES(Booking_id, Booking_date, Table_Number, Customer_ID);
SELECT "New Booking Added" AS Confirmation;    
END //
DELIMITER ;
```
![Task 10 AddBooking Procedure Result](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/bf6f90cd-95e0-458d-b9df-7db48b099224)

### Task 10
Little Lemon needs to create a new procedure called UpdateBooking that they can use to update existing bookings in the booking table. The procedure should have two input parameters in the form of booking id and booking date. It must also include an UPDATE statement inside the procedure.
```
DELIMITER //
CREATE PROCEDURE UpdateBooking(Booking_id INT, Booking_date Date)
BEGIN
UPDATE bookings
SET BookingDate = Booking_date
WHERE BookingID = Booking_id;
SELECT CONCAT("Booking ", Booking_id, " updated") AS Confirmation;     
END //
DELIMITER ;
```
![Task 11 UpdateBooking Procedure Result](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/c4be140d-82e6-40c9-a0ad-9c8d1f0f945a)

### Task 11
Little Lemon need you to create a new procedure called CancelBooking that they can use to cancel or remove a booking. The procedure should have one input parameter in the form of booking id. It must also include a DELETE statement inside the procedure.
```
DELIMITER //
CREATE PROCEDURE CancelingBooking(Booking_id INT)
BEGIN
DELETE FROM
bookings
WHERE BookingID = Booking_id;
SELECT CONCAT("Booking ", Booking_id, " is cancelled") AS Confirmation;    
END //
DELIMITER ;
```
![Task 12 CancelingBooking Procedure Result](https://github.com/DannyRukks/Little-Lemon-Database-Project/assets/97890440/7339239f-4590-4b46-9e7a-3fe90dce7b31)
