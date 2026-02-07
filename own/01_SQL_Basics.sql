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


-- Sorting the data with "Order By" 
SELECT * 
FROM customers
ORDER BY score DESC

SELECT * 
FROM customers
ORDER BY score ASC


-- nested sorting 
-- sort the results by the country and then by the highest score
-- columns order in ORDER BY is crucial, as sorting is sequential
select *
from customers 
order by country asc,score desc

-- GROUP BY (combines them) Aggregates the column by another column 
-- Find the total score for each country
select country,
sum(score) as total_score
from customers 
group by country


-- The select columns must be used in group by clause
-- All the columns in the SELECT must be either "aggregated" or included in the GROUP BY clause
select 
	country,
	first_name,
	sum(score) as total_score
from customers 
group by country,first_name

-- Find the total score and total number of customers for each country 
select 
	country,
	sum(score) as total_score,
	count(id) as total_customers
from customers 
group by country

select * from customers

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
-- GROUP BY HAVING filters the data "after" the aggregation
/* 
Find the average score from each country considering only customers with a score not equal to 0
and return only those countires with an average score greater than 430
*/

select 
country,
avg(score) as avg_score
from customers 
where score != 0 
group by country 
having  avg(score) > 430  -- having clause takes only aggregated column

-- Removing duplicates with "DISTINCT"
select distinct 
country 
from customers 



-- TOP (limit) -- Restrict the number of rows 
SELECT TOP 3 
* 
FROM customers 

select top 5 
* 
from orders



-- Retrieve top 3 customers with highest scores 
select top 3 *
from customers 
order by score desc


-- Retrieve the lowest 2 customers based on the score 
select top 2 * 
from customers 
order by score asc


-- Get 2 most recent orders 
select top 2 * from orders
order by order_date desc


-- SQL query "coding order"
SELECT DISTINCT TOP 2 
col1,
SUM(col2)
FROM TABLE
WHERE col1 = 1          -- WHERE clause filter rows before aggregations
GROUP BY col1           -- GROUP BY combines the rows with same column
HAVING SUM(col2) > 30   -- HAVING "condition" Filter rows after aggregations. HAVING clause is second type of filtering the data
ORDER BY col1 ASC       -- ORDER BY used to sort the column



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