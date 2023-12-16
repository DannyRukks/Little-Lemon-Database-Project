use littlelemondb;

DELIMITER //

CREATE PROCEDURE AddValidBooking(Booking_date Date, Table_Number INT)
BEGIN
	IF(Table_Number IN (TableNumber)) THEN
		RETURN CONCAT("Table ", Table_Number, " Already booked - booking cancelled");
	END IF;
          
INSERT INTO bookings(BookingID, BookingDate, TableNumber, CustomerID)
VALUES(5, Booking_date, Table_Number, 4);
  
END //
DELIMITER ;

CALL AddValidBooking("2022-10-10", 3);



