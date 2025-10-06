 -- in order to export the data divide the orders into 2 groups
 

 SELECT
	*,
	NTILE(2) OVER(order by OrderID) as grouped
 FROM mysqlproject.orders;
 
 -- find the product that fall within the highest 40% of the prices
SELECT *
FROM( 
 SELECT
	*,
    cume_dist() OVER(order by Price DESC) as rankul
 FROM mysqlproject.products
 )t WHERE rankul <= 0.4;
 
 -- analyze the months over month performance by finding the percentage change in sales between the curent and previous month
 SELECT
	*,
	previoussales - curmonth as perfomance,
    ROUND(CAST((curmonth - previoussales) AS FLOAT) / previoussales * 100 ,2) as percentage
    FROM(
 SELECT
    MONTH(OrderDate) as monthul,
    SUM(Sales) as curmonth,
    LAG(SUM(Sales)) OVER(order by MONTH(OrderDate)) as previoussales
 FROM mysqlproject.orders
 GROUP BY MONTH(OrderDate)
 )t