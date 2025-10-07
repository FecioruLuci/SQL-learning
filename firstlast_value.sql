-- analyze customer loyalty by ranking customers based on the average number of days between orders
SELECT
	CustomerID,
    AVG(difference),
    RANK() OVER(order by AVG(difference) ASC) as ranking
    FROM(
SELECT
	OrderID,
    CustomerID,
    CreationTime as currentorder,
    LEAD(CreationTime) OVER(partition by CustomerID) as nextorder,
    DATEDIFF(LEAD(CreationTime) OVER(partition by CustomerID), CreationTime) as difference
FROM mysqlproject.orders
ORDER BY CustomerID, CreationTime
)t
WHERE difference is not NULL
GROUP BY CustomerID;

-- find the lowest and highest sales for each product

SELECT
	ProductID,
    Sales,
    first_value(Sales) OVER(partition by ProductID order by Sales) as lowestvalue,
    last_value(Sales) OVER(partition by ProductID order by Sales rows between unbounded preceding and unbounded following) as highestvalue,
    first_value(Sales) OVER(partition by ProductID order by Sales DESC) high2
FROM mysqlproject.orders;

