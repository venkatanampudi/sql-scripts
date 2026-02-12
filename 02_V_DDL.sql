-----------------------------  ****** Section 3: Data Definition Language(DDL)*****--------------------------
/*
CREATE table
ALTER table
DROP table
*/

-- CREATE table

/* 
Create a new table called "persons" with columns: id, person_name, birth_date, and phone
*/

USE MyDatabase;
CREATE TABLE persons (
id INT NOT NULL,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY (id)
);


-- ALTER table 
-- add email column to the persons table
USE MyDatabase;
ALTER TABLE persons 
ADD email VARCHAR(50) NOT NULL;

-- Removing the column from the table
USE MyDatabase;
ALTER TABLE persons 
DROP COLUMN phone;


-- DROP the table (delete the table persons from database)
USE MyDatabase;
DROP TABLE persons;
