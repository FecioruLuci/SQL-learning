-- find the average score of the customers

SELECT
	CustomerID,
    Score,
    AVG(Score) OVER () AvgScore
FROM mysqlproject.customers
WHERE Score != "";

-- if i put a condition so we dont count null values in my case no char on text, mysql will only count the score rows with values if i dont put the condition it will add 0 value and divide by all rows

  -- display the full name of customers in a single field
  
  SELECT
	CustomerID,
	FirstName,
    LastName,
	CASE
		WHEN FirstName OR LastName = "" THEN NULL
        ELSE CONCAT(FirstName, " ", LastName)
        END AS Fullname
	FROM mysqlproject.customers;
    
    -- if i want to just concat and dont care if i have an empty column and add 10+ bonus score
    
    SELECT
		CustomerID,
        FirstName,
        LastName,
        Score,
        CONCAT(FirstName, " ", LastName) AS FULLNAME,
        Score + 10 AS TotalScore,
        CASE
        WHEN Score = "" THEN 0
        ELSE Score + 10
        END AS TotalScore2
	FROM mysqlproject.customers;


-- i should add +10 no matter what but i played a bit more and made a condition if score is null / nothing it will remain 0

-- sort the customers from the highest scores, with nulls appearing last

SELECT *
FROM mysqlproject.customers;

SELECT
	CustomerID,
    Score,
    CASE
    WHEN Score = "" THEN NULL
    ELSE Score
    END AS FinalScore
FROM mysqlproject.customers
ORDER BY FinalScore IS NULL, FinalScore ASC;
-- i could have let it simple and just order by score desc but i wanted to still show null there
-- i've used double order first we order by null, if its null = 1 if not = 0 so null will be the last one and then we sort by score 


-- find the sales price for each order by dividing the sales by the quantity

SELECT
	OrderID,
    Sales,
    Quantity,
    Sales / NULLIF(Quantity, 0) AS SalesPrice
    
FROM mysqlproject.orders;

-- even without using the nullif function we still get NULL in salesprice

-- identify the customers who has no scores
SELECT
	CustomerID,
    FirstName,
    Score
FROM mysqlproject.customers
WHERE Score IS NULL OR Score = "";

-- show a list of customers who have scores

SELECT 
	CustomerID,
    FirstName,
    Score
FROM mysqlproject.customers
WHERE Score IS NOT NULL AND Score != ""
