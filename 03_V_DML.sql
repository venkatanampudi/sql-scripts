-----------------*****DATA MANIPULATION LANGUAGE (DML)***** ----------------------
/*
INSERT
UPDATE
DELETE
*/

-- INSERT
-- If no columns specified, SQL expects values for all columns
INSERT INTO table_name (col1,col2,col3,...) 
VALUES (value1,value2,value3,...)

INSERT INTO customers (id,first_name,country,score) 
VALUES
	(6,'Anna','USA',NULL),
	(7,'Jane','Germany',100),
	(8,'Bob','UK',99)

SELECT * FROM customers;

INSERT INTO customers
VALUES (10,'Tom','Canada',500)

--INSERT USING SELECT (using another table) 
-- copy data from 'customers' table into 'persons'
-- first write the query for the source table then insert into target table 
INSERT into persons (id,person_name,birth_date,phone)
SELECT 
id,
first_name,
NULL,
'Unknown'
FROM customers 

SELECT * FROM persons;

--UPDATE  (Do not miss WHERE condition)
UPDATE table_name 
SET col1=val1,
	col2=val2
WHERE <condition>

SELECT * FROM customers;

--TASK: Update score "NULL" to "0" in customers table
UPDATE customers 
SET score=0
WHERE id=6;

UPDATE customers 
SET score=200
WHERE id=6;

UPDATE customers 
SET score=3000
WHERE id=5;

--TASK: Upate country, score for id=9 (multiple columns update). 
UPDATE customers
SET score = 570,
	country = 'Spain'
WHERE id=9;

--DELETE (DO NOT MISS WHERE condition. Otherwise whole table gets deleted)
DELETE FROM table_name 
WHERE <condition>

--TASK: Delete all customers with an "id > 5" 
DELETE FROM customers
WHERE id > 5;

--Delete all the data from table "persons". Delete command is slow as it need to check many things before delete.
--TRUNCATE clears the whole table without checking or logging (structure is intact)

DELETE FROM persons -- this will delete all the rows but slow to complete.

TRUNCATE TABLE persons;  -- TRUNCATE is much faster than DELETE

SELECT * FROM persons;
