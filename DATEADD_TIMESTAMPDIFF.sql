SELECT *
FROM mysqlproject.orders;

SELECT
	ShipDate,
    OrderDate,
	CreationTime,
    DATE_ADD(CreationTime, INTERVAL 2 HOUR),
    DATE_ADD(CreationTime, INTERVAL 10 MINUTE),
    DATE_ADD(CreationTime, INTERVAL 2 DAY),
    DATE_ADD(CreationTime, INTERVAL 3 YEAR),
    DATE_ADD(CreationTime, INTERVAL -10 DAY),
    (YEAR(ShipDate) - Year(OrderDate)) * 12 + MONTH(ShipDate) - MONTH(OrderDate) as monthdiff,
    (YEAR(ShipDate) - Year(OrderDate)) * 365 + (MONTH(ShipDate) - MONTH(OrderDate)) * 31 + DAY(ShipDate) - DAY(OrderDate) as daydiff
FROM orders;

-- calculate the age of employees

SELECT
    TIMESTAMPDIFF(YEAR, BirthDate, CURDATE())
FROM mysqlproject.employees;

-- find the average shiping duration for each month

SELECT
	MONTH(OrderDate),
    AVG(TIMESTAMPDIFF(DAY, OrderDate, ShipDate))
FROM mysqlproject.orders
GROUP BY MONTH(OrderDate)
ORDER BY MONTH(OrderDate) ASC;


