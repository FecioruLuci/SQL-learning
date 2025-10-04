-- find the total sales across all orders
-- find the total sales for each product and show OrderID and OrderDate

SELECT
	ProductID,
    OrderDate,
    Sales,
	SUM(Sales) OVER() as TotalSales,
    SUM(Sales) OVER (partition by ProductID) as TotalSalesPerProduct
FROM mydataset.orders;

-- find the percentage contribution of each product sales to the total sales

SELECT
	OrderID,
    ProductID,
    Sales,
    SUM(Sales) OVER() as TotalSales,
    ROUND(Sales / SUM(Sales) OVER() * 100, 2) as Percentage
FROM mydataset.orders;