SELECT *
FROM mydataset.customers;
-- Retrieve all customers from germany
SELECT *
FROM mydataset.customers
WHERE Country = "Germany";
-- Retreive all customers that are not from germany

SELECT *
FROM mydataset.customers
WHERE Country != "Germany";

-- Retreive all customers with a score greater than 500

SELECT *
FROM mydataset.customers
WHERE Score > 500;

-- Retreive all customers with a score of 500 or more

SELECT *
FROM mydataset.customers
WHERE Score >= 500;

-- Retreive all customers with a score less than 500

SELECT *
FROM mydataset.customers
WHERE Score < 500;

-- Retreive all customers with a score of 500 of less

SELECT *
FROM mydataset.customers
WHERE Score <= 500;

-- Retreive all customers from USA and have a score greater than 500

SELECT *
FROM mydataset.customers
WHERE Country = "USA" AND Score > 500;

-- Retreive all the customers who are either from USA or have a score greater than 500

SELECT *
FROM mydataset.customers
WHERE Country = "USA" OR Score > 500;

-- Retreive customers with a score NOT greater than 500

SELECT *
FROM mydataset.customers
WHERE NOT Score < 500;

-- Retreive all customers with a score falls in the range of 100 and 500

SELECT *
FROM mydataset.customers
WHERE Score BETWEEN 100 AND 500;

-- Retreive al customers from either Germany or USA

SELECT *
FROM mydataset.customers
WHERE Country IN("USA","Germany");

-- 