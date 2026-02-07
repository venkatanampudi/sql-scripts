-----------------------------  ****** Section 2: SELECT Query *****--------------------------
-- use MyDatabase
USE MyDatabase;

/* 
This is a
multi line 
comment 
*/ 
SELECT *
FROM customers

SELECT * 
FROM orders

SELECT
	order_id,
	customer_id,
	sales
FROM orders

SELECT 
	id,
	first_name,
	country,
	score
FROM customers
WHERE score > 500


SELECT * 
FROM customers 
WHERE score != 0 

SELECT * 
FROM customers 
WHERE country = 'Germany'


-- Sorting the data with "ORDER BY"  
SELECT * 
FROM customers
ORDER BY score DESC

SELECT * 
FROM customers
ORDER BY score ASC


-- nested sorting 
-- sort the results by the country and then by the highest score
-- columns order in ORDER BY is crucial, as sorting is sequential
SELECT *
FROM customers 
ORDER BY country ASC,score DESC

-- GROUP BY (combines them) aggregates the column data with same column
-- Find the total score for each country
SELECT country,
sum(score) AS total_score
FROM customers 
GROUP BY country


-- The SELECT columns must be used in GROUP BY clause
-- All the columns in the SELECT must be in either "aggregated" or included in the GROUP BY clause
SELECT
	country,
	first_name,
	sum(score) AS total_score
FROM customers 
GROUP BY country,first_name

-- Find the total score and total number of customers for each country 
SELECT 
	country,
	sum(score) AS total_score,
	count(id) AS total_customers
FROM customers 
GROUP BY country

SELECT * FROM customers

-- *** HAVING *** -- 
-- Filters the data after aggregation
-- can be used only with Group By and after Group By
SELECT 
country,
SUM(score)
FROM Table
--WHERE score > 400
GROUP BY country
HAVING sum(score) > 800 


-- WHERE caluse filter the data "before" aggregration 
-- GROUP BY combines the rows with same column
-- HAVING clause filters the data "after" the aggregation
/* 
Find the average score from each country considering only customers with a score not equal to 0
and return only those countires with an average score greater than 430
*/

SELECT 
country,
avg(score) as avg_score
FROM customers 
WHERE score != 0 
GROUP BY country 
HAVING avg(score) > 430   --HAVING clause takes "only" aggregated columns

-- Removing duplicates with "DISTINCT"
SELECT DISTINCT
country 
FROM customers 

--TOP (limit) -- Restrict the number of rows 
SELECT TOP 3 
* 
FROM customers 

SELECT TOP 5 
* 
FROM orders

-- Retrieve top 3 customers with highest scores 
SELECT TOP 3 *
FROM customers 
ORDER BY score DESC

-- Retrieve the lowest 2 customers based on the score 
SELECT TOP 2 * 
FROM customers 
ORDER BY score ASC

-- Get 2 most recent orders 
SELECT TOP 2 * FROM orders
ORDER BY order_date DESC

-- SQL query "coding order"
SELECT DISTINCT TOP 2 
col1,
SUM(col2)
FROM TABLE
WHERE col1 = 1          -- WHERE clause filter rows before aggregations
GROUP BY col1           -- GROUP BY combines the rows with same column
HAVING SUM(col2) > 30   -- HAVING ("condition") clause filters rows after aggregations.HAVING clause is second type of filtering the data
ORDER BY col1 ASC       -- ORDER BY clause is used to sort (ASC/DESC) of the column

-- SQL query "execution order" 
1. FROM 
2. WHERE 
3. GROUP BY 
4. HAVING
5. SELECT DISTINCT
6. ORDER BY 
7. TOP

-- Multi queries 
SELECT * 
FROM customers;

SELECT * 
FROM orders;

--Static fixed values 
SELECT 123 AS static_number;
SELECT 'Hello' AS static_string;

SELECT 
id,
first_name,
'NEW CUSTOMER' as customer_type  --This value is from you... not from the database 
FROM customers 

-- Highlight & Execute (just highlight the part of the query you want and execute instead of executing the whole query.
SELECT * 
FROM customers 
WHERE country = 'Germany'