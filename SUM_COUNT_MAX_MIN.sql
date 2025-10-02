SELECT
	CustomerID,
    SUM(Sales)
FROM mysqlproject.orders
GROUP BY CustomerID;

SELECT
	CustomerID,
	AVG(Sales)
FROM mysqlproject.orders
GROUP BY CustomerID
ORDER BY CustomerID DESC;

SELECT
	CustomerID,
    Sales
FROM mysqlproject.orders;

-- find the total number of orders

SELECT
	Count(*) AS totalnrorders
FROm mysqlproject.orders;

-- Find the total sales of all orders

SELECT
	SUM(Sales) AS total_sales
FROM mysqlproject.orders;

-- find the average sales of all orders

SELECT
	AVG(Sales) AS averagesales
FROM mysqlproject.orders;

-- find the highest sales of all orders

SELECT
	MAX(Sales) as Highestsale
FROM mysqlproject.orders;

-- find the lowest sales of all orders

SELECT
	MIN(Sales) AS lowestSale
FROM mysqlproject.orders
