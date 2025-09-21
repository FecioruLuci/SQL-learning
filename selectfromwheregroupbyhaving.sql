SELECT *
FROM mytable.customers;
-- Select some of collumns

SELECT 
	FirstName,
    Country,
    Score
FROM mytable.customers;


-- Retrieve customers with score not equal to 0

SELECT *
FROM mytable.customers
WHERE Score != 0;

-- Retrieve customers from Germany

SELECT *
FROM mytable.customers
WHERE Country = "Germany";

-- Retrieve customers and sord them by highest score first

SELECT *
FROM mytable.customers
ORDER BY Score DESC;

-- Sort by country and the highest score

SELECT *
FROM mytable.customers
ORDER BY Country, Score DESC;

-- by score then country

SELECT *
FROM mytable.customers
ORDER BY Score DESC, Country;

-- Find the total score of each country


SELECT
    Country,
    FirstName,
    SUM(Score) as Total
FROM mytable.customers
GROUP BY Country,FirstName;

-- Total score and total customers for each country

SELECT
	SUM(Score) as total_score,
    COUNT(CustomerID) as totalCustomers,
    Country
FROM mytable.customers
GROUP BY Country;


-- Average score for each country, only customers with score not equal to 0 return only countrys with score > 430


SELECT
	AVG(Score) as Average,
    Country
FROM mytable.customers
WHERE Score != 0
GROUP BY Country
HAVING Average > 430;
    