CREATE DATABASE mysqlproject;

SELECT * 
FROM mysqlproject.customers;

SELECT
	3.57261,
    ROUND(3.57261 , 2) as RoundValue;
    
SELECT
	-23,
    ABS(-23) as absvalue;
    
SELECT
	OrderID,
    OrderDate,
    ShipDate,
    CreationTime,
    NOW() as Today,
    "09.29.2025" as HardCoded
FROM orders;


-- extract the year from creationg time column

SELECT
	CreationTime,
    YEAR(CreationTime) as YearOnly
FROM orders;

-- extract the month and day from creation time column

SELECT
	CreationTime,
    WEEK(CreationTime) as weeknumber,
    QUARTER(CreationTime) as trimestru,
    MONTH(CreationTime),
    DAYNAME(CreationTime) as nameofday,
    MONTHNAME(CreationTime) as nameofmonth,
    DAY(CreationTime)
FROM orders
ORDER BY DAY(CreationTime) ASC;

-- how many orders were placed each year?

SELECT
	YEAR(OrderDate),
    COUNT(*)
FROM orders
GROUP BY YEAR(OrderDate);

-- how many orders were placed each month ??

SELECT
	MONTHNAME(OrderDate),
    COUNT(*)
FROM orders
GROUP BY MONTHNAME(OrderDate);

-- how many orders were placed each day??

SELECT
	DAY(OrderDate),
    COUNT(*)
FROM orders
GROUP BY DAY(OrderDate);

-- show all the orders that were placed during the month of february

SELECT *
FROM orders
WHERE MONTHNAME(OrderDate) = "February"

    