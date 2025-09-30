SELECT *
FROM mysqlproject.orders;

SELECT
	CreationTime,
    OrderID,
    DATE_FORMAT(CreationTime, "%m-%d-%Y") as USA_FORMAT,
    DATE_FORMAT(CreationTime, "%d-%m-%Y") as EU_FORMAT,
    DATE_FORMAT(CreationTime, '%M') as luna,
    DATE_FORMAT(CreationTime, "%D") as zi,
    DATE_FORMAT(CreationTIme, "%y") as an,
    DATE_FORMAT(CreationTime, "%W") as ziua
FROM mysqlproject.orders;

-- Show creation time using the following format:
-- day wed jan 2025 12:34:56 PM Q1

SELECT
	CreationTime,
    CONCAT(DATE_FORMAT(CreationTime, "%d %W %M %Y %H %i %S %p")," Q", QUARTER(CreationTime)) as formated
FROM mysqlproject.orders;

SELECT
	DATE_FORMAT(OrderDate, "%M %y"),
    COUNT(*)
FROM mysqlproject.orders
GROUP BY DATE_FORMAT(OrderDate, "%M %y");

-- Convert string to integer

SELECT
    CAST("2024-01-02" AS DATE);
    
SELECT
	CAST("2025-12-25 14:25:30" AS DATETIME);
    
SELECT
	STR_TO_DATE("09/30/2025", "%m/%d/%Y");
    
SELECT
	CAST("123" AS SIGNED);
    
SELECT
	CAST(123 AS CHAR)