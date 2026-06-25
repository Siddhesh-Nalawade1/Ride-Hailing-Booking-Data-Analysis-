-- =====================================================================
-- OLA Ride Booking Data Analysis - SQL Queries
-- Dataset: Bookings-100000-Rows.xlsx (103,024 rows, 01-Jul-2024 to 31-Jul-2024)
-- =====================================================================

-- ---------------------------------------------------------------------
-- Database & Table Setup
-- ---------------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS Ola;
USE Ola;

CREATE TABLE IF NOT EXISTS bookings (
    Booking_Date                 DATE,
    Booking_Time                 TIME,
    Booking_ID                   VARCHAR(20) PRIMARY KEY,
    Booking_Status                VARCHAR(30),
    Customer_ID                  VARCHAR(20),
    Vehicle_Type                  VARCHAR(20),
    Pickup_Location               VARCHAR(100),
    Drop_Location                  VARCHAR(100),
    V_TAT                          FLOAT,          -- Vehicle turnaround time
    C_TAT                          FLOAT,          -- Customer turnaround time
    Canceled_Rides_by_Customer    VARCHAR(100),
    Canceled_Rides_by_Driver      VARCHAR(100),
    Incomplete_Rides               VARCHAR(5),
    Incomplete_Rides_Reason        VARCHAR(100),
    Booking_Value                  INT,
    Payment_Method                 VARCHAR(20),
    Ride_Distance                  INT,
    Driver_Ratings                 FLOAT,
    Customer_Rating                FLOAT
);

-- Load data into the table (adjust to your SQL client's import method,
-- e.g. \copy in PostgreSQL, LOAD DATA INFILE in MySQL, or import wizard)
-- COPY bookings FROM 'Bookings-100000-Rows.csv' DELIMITER ',' CSV HEADER;


-- ---------------------------------------------------------------------
-- Q1. Retrieve all successful bookings
-- ---------------------------------------------------------------------
SELECT *
FROM bookings
WHERE Booking_Status = 'Success';


-- ---------------------------------------------------------------------
-- Q2. Find the average ride distance for each vehicle type
-- ---------------------------------------------------------------------
SELECT Vehicle_Type,
       AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;


-- ---------------------------------------------------------------------
-- Q3. Get the total number of cancelled rides by customers
-- ---------------------------------------------------------------------
SELECT COUNT(*) AS total_cancelled_by_customer
FROM bookings
WHERE Booking_Status = 'Canceled by Customer';


-- ---------------------------------------------------------------------
-- Q4. List the top 5 customers who booked the highest number of rides
-- ---------------------------------------------------------------------
SELECT Customer_ID,
       COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;


-- ---------------------------------------------------------------------
-- Q5. Get the number of rides cancelled by drivers due to personal
--     and car-related issues
-- ---------------------------------------------------------------------
SELECT COUNT(*) AS driver_personal_car_cancellations
FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';


-- ---------------------------------------------------------------------
-- Q6. Find the maximum and minimum driver ratings for Prime Sedan bookings
-- ---------------------------------------------------------------------
SELECT MAX(Driver_Ratings) AS max_rating,
       MIN(Driver_Ratings) AS min_rating
FROM bookings
WHERE Vehicle_Type = 'Prime Sedan';


-- ---------------------------------------------------------------------
-- Q7. Retrieve all rides where payment was made using UPI
-- ---------------------------------------------------------------------
SELECT *
FROM bookings
WHERE Payment_Method = 'UPI';


-- ---------------------------------------------------------------------
-- Q8. Find the average customer rating per vehicle type
-- ---------------------------------------------------------------------
SELECT Vehicle_Type,
       AVG(Customer_Rating) AS avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;


-- ---------------------------------------------------------------------
-- Q9. Calculate the total booking value of rides completed successfully
-- ---------------------------------------------------------------------
SELECT SUM(Booking_Value) AS total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';


-- ---------------------------------------------------------------------
-- Q10. List all incomplete rides along with the reason
-- ---------------------------------------------------------------------
SELECT Booking_ID,
       Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides = 'Yes';



