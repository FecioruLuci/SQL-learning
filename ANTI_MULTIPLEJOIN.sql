-- Get all customers who haven't placed any order

SELECT *
FROM mydataset.customers AS c
LEFT JOIN mydataset.orders AS o
ON c.ID = o.CustomerID
WHERE o.OrderID IS NULL;

-- Return rows from right that has no match with left

SELECT *
FROM mydataset.orders AS O
LEFT JOIN mydataset.customers AS C
ON o.CustomerID = c.ID
WHERE c.ID IS NULL;

-- find customers without orders and orders without customers

SELECT *
FROM mydataset.customers AS C
LEFT JOIN mydataset.orders AS O
ON C.ID = O.CustomerID
WHERE O.CustomerID IS NULL

UNION

SELECT *
FROM mydataset.orders AS O
LEFT JOIN mydataset.customers AS C
ON O.CustomerID = C.ID
WHERE C.ID IS NULL;

-- Get all customers along with their orders, but only for customers who have placed an order

SELECT *
FROM mydataset.customers AS C
LEFT JOIN mydataset.orders AS O
ON C.ID = O.CustomerID
WHERE O.CustomerID IS NOT NULL

UNION

SELECT *
FROM mydataset.orders AS O
LEFT JOIN mydataset.customers AS C
ON O.CustomerID = C.ID
WHERE C.ID IS NOT NULL;

SELECT *
FROM mydataset.customers AS C
LEFT JOIN mydataset.orders AS O
ON C.ID = O.CustomerID
WHERE O.CustomerID IS NOT NULL;

-- Generate all possible combinations of custoemrs and orders

SELECT *
FROM mydataset.customers
CROSS JOIN mydataset.orders;

-- Using salesDb, retrieve a list of all orders, along with the related customer, produsct, and employee details
-- ORDER ID, Customer's name, Product name, Sales, Price, Sale's Person's name

SELECT *
FROM mydataset.customers;

SELECT *
FROM mydataset.employees;

SELECT *
FROM mydataset.orders;

SELECT *
FROM mydataset.ordersarchive;

SELECT *
FROM mydataset.products;


SELECT
	O.OrderID,
    O.Sales,
    C.FirstName,
    c.LastName,
    P.Product AS ProductName,
    P.Price,
    E.FirstName AS EmplFirstName,
    E.LastName AS EmplLastName
FROM mydataset.orders AS O
LEFT JOIN mydataset.customers AS C
ON O.CustomerID = C.ID
LEFT JOIN mydataset.products AS P
ON O.ProductID = P.ProductID
LEFT JOIN mydataset.employees as E
ON O.SalesPersonID = E.EmployeeID


