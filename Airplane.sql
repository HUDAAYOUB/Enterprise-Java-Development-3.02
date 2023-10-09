create schema airplane;
use airplane;
CREATE TABLE Flight_Details (
    FlightNumber VARCHAR(10) PRIMARY KEY,
    Aircraft VARCHAR(50),
    FlightMileage INT
);
CREATE TABLE Aircraft_Details (
    Aircraft VARCHAR(50) PRIMARY KEY,
    TotalAircraftSeats INT
);
CREATE TABLE Customer_Details (
    CustomerName VARCHAR(100) PRIMARY KEY,
    CustomerStatus VARCHAR(50),
    TotalCustomerMileage INT
);
CREATE TABLE Customer_Flights (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100),
    FlightNumber VARCHAR(10),
    FOREIGN KEY (CustomerName) REFERENCES Customer_Details(CustomerName),
    FOREIGN KEY (FlightNumber) REFERENCES Flight_Details(FlightNumber)
);

INSERT INTO Flight_Details (FlightNumber, Aircraft, FlightMileage)
VALUES
('DL143', 'Boeing 747', 135),
('DL122', 'Airbus A330', 4370),
('DL53', 'Boeing 777', 2078),
('DL222', 'Boeing 777', 1765),
('DL37', 'Boeing 747', 531);

INSERT INTO Aircraft_Details (Aircraft, TotalAircraftSeats)
VALUES
('Boeing 747', 400),
('Airbus A330', 236),
('Boeing 777', 264);




INSERT INTO Customer_Details (CustomerName, CustomerStatus, TotalCustomerMileage)
VALUES
('Agustine Riviera', 'Silver', 115235),
('Alaina Sepulvida', 'None', 6008),
('Tom Jones', 'Gold', 205767),
('Sam Rio', 'None', 2653),
('Jessica James', 'Silver', 127656),
('Ana Janco', 'Silver', 136773),
('Jennifer Cortez', 'Gold', 300582),
('Christian Janco', 'Silver', 14642);

INSERT INTO Customer_Flights (CustomerName, FlightNumber)
VALUES
('Agustine Riviera', 'DL143'),
('Agustine Riviera', 'DL122'),
('Alaina Sepulvida', 'DL122'),
('Tom Jones', 'DL122'),
('Tom Jones', 'DL53'),
('Sam Rio', 'DL143'),
('Jessica James', 'DL143'),
('Ana Janco', 'DL222'),
('Jennifer Cortez', 'DL222'),
('Christian Janco', 'DL222');

SELECT COUNT(*) AS TotalFlights
FROM Flight_Details;

SELECT AVG(FlightMileage) AS AverageFlightDistance
FROM Flight_Details;

SELECT AVG(TotalAircraftSeats) AS AverageSeats
FROM Aircraft_Details;


SELECT CustomerStatus, AVG(TotalCustomerMileage) AS AverageMiles
FROM Customer_Details
GROUP BY CustomerStatus;



SELECT CustomerStatus, MAX(TotalCustomerMileage) AS MaxMiles
FROM Customer_Details
GROUP BY CustomerStatus;



SELECT COUNT(*) AS TotalBoeingAircraft
FROM Aircraft_Details
WHERE Aircraft LIKE '%Boeing%';

SELECT *
FROM Flight_Details
WHERE FlightMileage BETWEEN 300 AND 2000;


SELECT CD.CustomerStatus, AVG(FD.FlightMileage) AS AverageFlightDistance
FROM Customer_Flights CF
JOIN Customer_Details CD ON CF.CustomerName = CD.CustomerName
JOIN Flight_Details FD ON CF.FlightNumber = FD.FlightNumber
GROUP BY CD.CustomerStatus;

SELECT CD.CustomerStatus, AD.Aircraft, COUNT(*) AS BookingCount
FROM Customer_Flights CF
JOIN Customer_Details CD ON CF.CustomerName = CD.CustomerName
JOIN Flight_Details FD ON CF.FlightNumber = FD.FlightNumber
JOIN Aircraft_Details AD ON FD.Aircraft = AD.Aircraft
WHERE CD.CustomerStatus = 'Gold'
GROUP BY CD.CustomerStatus, AD.Aircraft
ORDER BY BookingCount DESC
LIMIT 1;








