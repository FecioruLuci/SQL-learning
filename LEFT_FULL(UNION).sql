SELECT *
FROM mydataset.customers;

SELECT *
FROM mydataset.orders;

-- Get all customers with their orders inclucding those witohut orders
SELECT
	customers.ID,
    customers.FirstName,
    orders.OrderID,
    orders.Sales
FROM mydataset.customers
LEFT JOIN mydataset.orders
ON orders.CustomerID = customers.ID;


-- Get all customers and all orders even if there is no match

SELECT
    customers.ID,
    customers.FirstName,
    orders.OrderID,
    orders.Sales
FROM mydataset.customers
LEFT JOIN mydataset.orders
ON customers.ID = orders.CustomerID

UNION

SELECT
    customers.ID,
    customers.FirstName,
    orders.OrderID,
    orders.Sales
FROM mydataset.customers
RIGHT JOIN mydataset.orders
ON customers.ID = orders.CustomerID;






