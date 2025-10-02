-- generate a report of the total sales for each category, sort by lowest to highest
SELECT
	Category,
    SUM(Sales) as totalsales
FROM(
SELECT
	OrderID,
    Sales,
    CASE
    WHEN Sales > 50 THEN "HIGH"
    WHEN Sales > 20 THEN "MEDIUM"
    ELSE "LOW"
    END Category
FROM mysqlproject.orders
)t
GROUP BY Category
ORDER BY totalsales DESC;

-- retreive employee details with gender displayed as full text

SELECT
    CASE
    WHEN Gender = "M" THEN "Male"
    ELSE "Female"
    END FullGender,
    COUNT(*) as gendercount
FROM mysqlproject.employees
GROUP BY FullGender;

-- retreive customer details with abbreviated country code

SELECT
	CustomerID,
    Country,
    CASE
    WHEN Country = "Germany" THEN "GE"
    ELSE "US"
    END abbcountry
FROM mysqlproject.customers;

SELECT
	distinct Country
FROM mysqlproject.customers;

-- find the average score for customers and treat nulls as 0

SELECT
    COALESCE(NULLIF(Score, ""), 0) as nonull,
    AVG(COALESCE(NULLIF(Score, ""), 0)) OVER () Avgcustomer
FROM mysqlproject.customers;

-- count how many times each customers has made an order greater than 30

SELECT
	CustomerID,
    SUM(CASE
    WHEN Sales > 30 THEN 1
    ELSE 0
    END) Flag,
    COUNT(*) Totalorders
FROM mysqlproject.orders
GROUP BY CustomerID
ORDER BY Flag DESC;

