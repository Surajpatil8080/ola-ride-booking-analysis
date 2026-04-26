SELECT * FROM "Booking_Data";

-- Q 1. Retrive all Succesfull Booking 
CREATE VIEW Successful_Bookings AS
SELECT * FROM "Booking_Data"
WHERE booking_status = 'Success'

SELECT * FROM Successful_Bookings

-- Q 2. Find The Average ride_Distance For Each vehical Type
CREATE VIEW Average_Ride_Distance AS 
SELECT vehicle_type,AVG(ride_distance) As AVG_Distance FROM "Booking_Data"
GROUP BY vehicle_type 

SELECT * FROM Average_Ride_Distance

-- Q 3. Get the total number of canceled rides by customer
CREATE VIEW Canceled_Ride_by_Customer AS 
SELECT COUNT(*) FROM "Booking_Data"
WHERE booking_status = 'Canceled by Customer'

SELECT * FROM Canceled_Ride_by_Customer

-- Q 4. List the top 5 customer who booked the highest number of rides
CREATE VIEW Highest_Top_5_Booked_Ride_Customer As
SELECT customer_id,COUNT(booking_id) AS Total_Ride FROM "Booking_Data" 
GROUP BY customer_id
ORDER BY Total_Ride DESC LIMIT 5;

SELECT * FROM Highest_Top_5_Booked_Ride_Customer

-- Q 5. Get The Number Of Rides Canceled by drivers due to personal and car_Related issue :
CREATE VIEW Canceled_ride_by_drivers AS
SELECT COUNT(*) AS Canceled_ride_by_driver FROM "Booking_Data"
WHERE canceled_rides_by_driver = 'Personal & Car related issue'
SELECT * FROM Canceled_ride_by_drivers

-- Q 6. Find The Max & Min driver rating for prime sedan bookings
CREATE VIEW max_min_driver_rating_for_prime_sedan AS 
SELECT MAX(driver_ratings) AS Max_Rating,
 	   MIN(driver_ratings) AS Min_Rating FROM "Booking_Data"
		WHERE vehicle_type ='Prime Sedan'

SELECT * FROM max_min_driver_rating_for_prime_sedan

-- Q 7. Retrive All Rides Where Payments Was Made Using UPI 
CREATE VIEW UPI_PAYMENT_METHOD AS
SELECT booking_id,payment_method FROM "Booking_Data"
WHERE payment_method = 'UPI'

SELECT * FROM UPI_PAYMENT_METHOD

-- Q 8. find the average customer rating per vehicle_type
CREATE VIEW AVG_CUSTOMER_RATINGS AS
SELECT vehicle_type, AVG(customer_rating)AS AVG_Customer_Rating FROM "Booking_Data"
GROUP BY vehicle_type

SELECT * FROM AVG_CUSTOMER_RATINGS 

-- Q 9. Calculate the total booking value of rides completed successfully
CREATE VIEW successfully_Rides AS 
SELECT SUM(booking_value) AS Successfully_Rides FROM "Booking_Data"
WHERE booking_status = 'Success'

SELECT * FROM successfully_Rides

-- Q 10. List of In Completed Rides Along With the Reason
CREATE VIEW Incompleted_Rides AS 
SELECT booking_id,incomplete_rides_reason FROM "Booking_Data"
WHERE incomplete_rides = 'Yes'

SELECT * FROM Incompleted_Rides