SELECT *
FROM mytable.customers;

INSERT INTO mytable.customers (CustomerID,LastName, Country, Score)
VALUES 
	(6,"Romica", "Romania", NULL),
	(7,"Daniel", NULL, 100);
    
-- Single column

INSERT INTO mytable.customers (CustomerID, FirstName, LastName)
VALUES
	(8,"Lepadatu","Robi");
    
    
CREATE TABLE persons(
id INT not NULL,
person_name VARCHAR(50) not NULL,
birth_date DATE,
phone VARCHAR(15) not NULL,
CONSTRAINT pk_persons PRIMARY KEY (id)
)

SELECT * 
FROM mytable.persons;

-- Insert data from customers to persons
INSERT INTO mytable.persons (id,person_name,birth_date,phone)
SELECT
CustomerID,
LastName,
NULL,
"Unknown"
FROM mytable.customers;

-- Change the score of customers with ID 6 to 0
SET SQL_SAFE_UPDATES = 0;
SELECT *
FROM mytable.customers;

UPDATE mytable.customers
SET Score = 0
WHERE CustomerID = 6;

-- we use sefe update to 0 so we can edit the columns

-- change the score of customer ID 8 to 0 and update the country to "UK" 

SELECT *
FROM mytable.customers;

UPDATE customers
SET 
	Score = 0,
    Country = "UK"
WHERE CustomerID = 8;

-- Update all customers with 0 score by setting their score to 150

UPDATE customers
SET
	Score = 150
WHERE Score = 0;

SELECT *
FROM customers;

-- Delete all customers with an ID greater than 5

DELETE FROM customers
WHERE CustomerID > 5;

UPDATE customers
SET
	LastName = "Travis"
WHERE CustomerID = 3;

-- Did that myself so i can have a clean dataset with no null data

-- Delete all data from the persons table

DELETE FROM persons;
-- Aswell we can use TRUNCATE TABLE Customers

SELECT *
FROM persons





	