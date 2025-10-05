-- find the average sales across all orders, find avg sales for each product and show details such as orderid and order date

SELECT
	OrderID,
    OrderDate,
    ProductID,
    ROUND(AVG(Sales) OVER()) as AverageSales,
    AVG(Sales) OVER(partition by ProductID) as AvgSalesPerProduct
FROM mydataset.orders;

-- find the average score of customers and show customerid and last name

SELECT
	ID,
    LastName,
    NULLIF(Score, "") as goodscore,
    Avg(NULLIF(Score, "")) OVER () as avgscore
FROM mydataset.customers;

-- find the all orders when the sales are higher than the average sales across all orders

SELECT
	OrderID,
    ProductID,
    Sales,
    ROUND(AVG(Sales) OVER ()) as avgsales,
    CASE
    WHEN Sales > ROUND(AVG(Sales) OVER ()) THEN 1
    ELSE 0
    END AS higher
FROM mydataset.orders;

-- or
SELECT *
FROM(
SELECT
	OrderID,
    ProductID,
    Sales,
    ROUND(AVG(Sales) OVER ()) as avgsales
FROM mydataset.orders
)t 
WHERE Sales > avgsales;

-- find the highest and lowest sales for all order, highest and lowest for each product and show information about order id and order date

SELECT
	OrderID,
    OrderDate,
    MAX(Sales) OVER() as maxsale,
    MIN(Sales) OVER() as lowsale,
    MAX(Sales) OVER(partition by ProductID) as maxsaleperproduct,
    MIN(Sales) OVER(partition by ProductID) as lowsaleperprodut
FROM mydataset.orders;

-- show the employees with the highest salaries
SELECT * 
FROM(
SELECT
	*,
    MAX(Salary) OVER() as maxsalaryemployee
FROM mydataset.employees
)t WHERE Salary = maxsalaryemployee;

-- calculate the deviation of each sale from both the minimum and maximum sales amount
SELECT
	OrderDate,
    OrderID,
    Sales,
    MAX(Sales) OVER() as maxsale,
    MIN(Sales) OVER() as minsale,
    Sales - MIN(Sales) OVER() as mindev,
    Sales - MAX(Sales) OVER() as maxdev
FROM mydataset.orders