-- rank the order based on their sales from the highest to the lowest

SELECT
	OrderID,
    ProductID,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) as SalesRank,
    RANK() OVER(order by Sales DESC) as SalesRanknorow,
    DENSE_RANK () OVER(order by Sales DESC) as DenseRanking
FROM mysqlproject.orders;

-- find the top highest sales for each product
SELECT *
FROM(
SELECT
	OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(partition by ProductID ORDER BY SALES DESC) as rankbyproduct
FROM mysqlproject.orders
)t WHERE rankbyproduct = 1;


-- find the lowest 2 customers base on their total sales
SELECT *
FROM(
SELECT
	CustomerID,
    SUM(Sales) as totalsales,
    ROW_NUMBER() OVER(order by SUM(Sales) ASC) as ranking
FROM mysqlproject.orders
GROUP BY CustomerID
)t WHERE ranking = 1 or ranking = 2;

-- assign unique ID's to the rows the Orders Arhive table

SELECT
	OrderID,
    row_number() OVER(order by OrderID ASC)
FROM mysqlproject.ordersarchive;

-- identify duplicate rows in the table orders archive and return a clean result without any duplicates
SELECT *
FROM (
SELECT
	OrderID,
    ProductID,
    CreationTime,
    ROW_NUMBER() OVER(partition by OrderID ORDER BY CreationTime DESC) as ranking
FROM mysqlproject.ordersarchive
)t WHERE ranking = 1;

SELECT
	OrderID,
    Sales,
    NTILE(1) OVER(order by Sales DESC) as onebucket,
    NTILE(2) OVER(order by Sales DESC) as twobucket,
    NTILE(3) OVER(order by Sales DESC) as threebucket
FROM mysqlproject.orders;

-- segment all orders in 3 categories high medium low sales
SELECT
OrderID,
Sales,
highmediumlow,
CASE
WHEN highmediumlow = 1 THEN "HIGH"
WHEN highmediumlow = 2 THEN "MEDIUM"
WHEN highmediumlow = 3 THEN "LOW"
END AS segmentare
FROM(
SELECT
	OrderID,
    Sales,
    NTILE(3) OVER(order by Sales DESC) as highmediumlow
FROM mysqlproject.orders
)t;


