-- find the total sales across all orders

SELECT *
FROM mydataset.orders;

SELECT 
    SUM(Sales) as TOTALSALES
FROM mydataset.orders;

-- find the total sales for each products aswell show the productid and orderdate

SELECT
	OrderID,
	ProductID,
    OrderDate,
    SUM(Sales) OVER(PARTITION BY ProductID) as Totalsales
FROM mydataset.orders;
-- sadly in my dataset doesnt have more than 1 sale per orderid but if it would, it would sum all of them grouped by productid

-- find the total sales of all orders and provide details such orderid and order date

SELECT
	OrderID,
    OrderDate,
	SUM(Sales) OVER () as TotalSales
FROM mydataset.orders;

-- find the total sales for each product and provide details such as order id and orderdate

SELECT
	OrderID,
    OrderDate,
	SUM(Sales) OVER (partition by ProductID)
FROm mydataset.orders;

-- find the total sales for each product and order status

SELECT
	OrderID,
	SUM(Sales) OVER (partition by ProductID, OrderStatus) as SalesbyProductandStatus
FROM mydataset.orders;

-- rank each order based on their sales from the highest to lowest

SELECT
	OrderID,
    OrderDate,
    Sales,
	RANK () OVER (order by Sales DESC) as rankul
FROM mydataset.orders;

