-- Create a table named persons with collumns id,person_name,birth_date and phone

CREATE TABLE Persons(
id INT not NULL,
person_name VARCHAR(50) not NULL,
birth_date DATE,
phone VARCHAR(15) not NULL,
CONSTRAINT pk_persons PRIMARY KEY (id)
);

SELECT *
FROM mydataset.persons;

-- Add a new column called email to the persons table

ALTER TABLE persons
ADD email VARCHAR(50) not NULL;

-- Remove the clumn phone from the table

ALTER TABLE persons
DROP COLUMN phone;

-- Delete the table persons from the db

DROP TABLE persons