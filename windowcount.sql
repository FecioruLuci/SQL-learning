-- find the total number of orders for each customer
-- provide details such as order id and order date

SELECT
	OrderID,
    OrderDate,
    CustomerID,
	Count(*) OVER(partition by CustomerID) as OrdersbyCustomer,
    Count(*) OVER() as ordercount
FROM mydataset.orders;

SELECT *
FROM mydataset.orders;

-- find the total number of customers and provide all customers details

SELECT *
FROM mydataset.customers;

SELECT
	FirstName,
    LastName,
    Country,
    Score,
	COUNT(*) OVER() as TotalCustomers
FROM mydataset.customers;

-- find the total number of scores for the customers

SELECT
	COUNT(Score) OVER() as TotalScore
FROM mydataset.customers;

-- here blank space is counted as score if i have null it wouldnt

-- check whether the table orders contains any duplicate rows

SELECT
	OrderID,
    COUNT(*) OVER(partition by OrderID) as duplicheck
FROM mydataset.orders;
SELECT *
FROM(
SELECT
	OrderID,
    COUNT(*) OVER (partition by OrderID) as duplicheck
FROM mydataset.ordersarchive
)t WHERE duplicheck > 1