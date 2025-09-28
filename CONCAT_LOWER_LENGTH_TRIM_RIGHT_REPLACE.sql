SELECT *
FROM customers;

-- show a list of customer's first name together with their country in one column

SELECT
	FirstName,
	Country,
    CONCAT(FirstName, " ", Country) AS FULL
FROM customers;

-- Convert the first name to lowercase

SELECT
	FirstName,
    LOWER(FirstName) as FirstNameLower
FROM customers;

-- Conver the firstname to uppercase

SELECT
	FirstName,
	UPPER(FirstName) AS FirstNameUpper
FROM customers;

-- find the customers whose first name contains leading or trailing spaces

SELECT
	FirstName,
    LENGTH(FirstName),
    LENGTH(TRIM(FirstName)) as lentrimvalue
FROM customers;

SELECT
	FirstName
FROM customers
WHERE TRIM(FirstName) != FirstName;

-- replace the - from a random phone number

SELECT
	"07-666-23-954" as oldnumber,
    REPLACE("07-666-23-954", "-", "") as PhoneNumber;
    
-- replace the .txt to .csv

SELECT
	"myproject.txt" as txtfile,
    REPLACE("myproject.txt", ".txt", ".csv") as csvfile;
    
-- calculate the length of each customer's last name

SELECT
	LastName,
    LENGTH(LastName) as stringcountnumber
FROM customers;

-- retreive the first 2 characters of each first name

SELECT
	FirstName,
    LEFT(FirstName, 2) as FirstChar
FROM customers;

-- retreive the last 2 characted of each last name

SELECT
	LastName,
    RIGHT(LastName, 2) as LastChar
FROM customers;

-- retreive a list of customer's first names removing the first character

SELECT
	FirstName,
    SUBSTRING(FirstName, 2)
FROM customers;
