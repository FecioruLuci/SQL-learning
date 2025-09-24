-- Find all customers whose first names starts with M

SELECT *
FROM mydataset.customers
WHERE FirstName LIKE "M%";

-- Find all customers whose first name ends with N
SELECT *
FROM mydataset.customers
WHERE FirstName LIKE "%N";

-- Find all customers whose firsty name constains r

SELECT *
FROM mydataset.customers
WHERE FirstName LIKE "%r%";

-- Find all customer whose 3rd possition is an r

SELECT *
FROM mydataset.customers
WHERE FirstName LIKE "__r%";

-- Select all data from customers and orders

SELECT *
FROM mydataset.customers;

SELECT *
FROM mydataset.orders;

-- Get all customers along with their orders, but only for customers who have placed an order
-- I have changed CustomerID to ID in customer.cvs file so i dont get an error
-- lately i've learned that u can use the name of the dataset so we can know from where the id comes from (from customers or orders if we have exact the same value in column)

SELECT
	customers.ID,
    customers.FirstName,
    customers.Country,
    orders.ProductID,
    orders.OrderDate,
    orders.ShipDate,
    orders.OrderStatus,
	orders.Quantity
FROM mydataset.customers
INNER JOIN mydataset.orders
ON customers.ID = orders.CustomerID

-- i've only selectec the columns that i think they are important

