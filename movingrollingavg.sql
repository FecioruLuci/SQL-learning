-- calculate the moving average of sales for each product over time

SELECT
	OrderID,
    OrderDate,
    ProductID,
    AVG(Sales) OVER(partition by ProductID ORDER BY OrderDate) as movingavg
FROM mysqlproject.orders;

-- calculate the moving average of sales for each product over time, inluding the next order.

SELECT
	OrderID,
    OrderDate,
    ProductID,
    Sales,
    AVG(Sales) OVER (partition by ProductID ORDER BY OrderDate ROWS between current row and 1 following) as includingnextone
FROM mysqlproject.orders