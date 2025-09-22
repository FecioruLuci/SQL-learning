SELECT *
FROM mydataset.customers;


-- find the average of each country where only customers with a score not equal to 0 and give score greater than 430

SELECT
	Country,
    AVG(Score) as score_avg
FROM mydataset.customers
WHERE Score != 0
GROUP BY Country
HAVING score_avg > 430;


-- return all unique list of all countrys

SELECT
	distinct CustomerID
FROM mydataset.customers;


-- retreive only 3 customers

SELECT *
FROM mydataset.customers
LIMIT 3;

-- Retrieve top 3 customers with the highest score

SELECT *
FROM mydataset.customers
ORDER BY Score Desc
LIMIT 3;

-- Retrieve the lowest 2 customers based on the score// there is a data error in csv file if i really want my score to have a number i just use WHERE Score != ""

SELECT *
FROM mydataset.customers
ORDER BY Score ASC
LIMIT 2;


-- Get the 2 most recent orders

SELECT *
FROM mydataset.orders
ORDER BY OrderDate DESC
LIMIT 2
