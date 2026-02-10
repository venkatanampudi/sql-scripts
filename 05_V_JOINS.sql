--- JOINS ---
/*
Combine the columns from multiple tables called Joining the tables and put the columns side by side. Remember that results table is wider.
INNER JOIN
FULL JOIN
LEFT JOIN
RIGHT JOIN
In order to join the table, we have to define a key column between the tables.

To combine (stack the rows from both tables) the rows from two tables we have to use "SET operators"
Take the rows from table A and put it in results table then take table B rows then stack on top of table A rows.
Here, the results table grow vertically.
To join tables using SET operators, tables should have exact number of columns.
UNION
UNION ALL
EXCEPT (minus)
INTERSECT

-- What is SQL joins? In order to query two tables, first we have to connect them. A common column need to exist in both (left & right) tables.
-- Why do we need "joins" actually ? 
-- 1. To (re)combine the data from multile tables to get a big picture of data
-- 2. Data enrichment (getting the extra data). For ex: customer (master table) and we have reference table (zip codes) so we can get enhanced customers table by adding zip codes.
-- 3. Check for existance (Filtering) For ex: For some customers we have to check their orders in another table (orders), that table is called "lookup table"

-- Join types (Basics)
NO JOIN
INNER JOIN
FULL JOIN
LEFT JOIN

-- Advanced joins 
LEFT ANTI JOIN
RIGHT ANTI JOIN
FULL ANTI JOIN
CROSS JOIN
*/

--NO JOIN : Returns data from all the tables without combining them.
SELECT * FROM A;
SELECT * FROM B;

-- Retrieve all data from customers and orders in two different results.
SELECT * FROM customers;
SELECT * FROM orders;

--INNER JOIN : Returns only matching rows from both tables.Only common data.
SELECT * FROM A
[TYPE] JOIN B    -- if nothing mentioned for TYPE, default is INNER JOIN 

SELECT * 
FROM A
INNER JOIN B
ON <condition>   --condition here how to match rows? 

SELECT *
FROM A
INNER JOIN B
ON A.key = B.key  -- order of the keys is important.

-- In INNER JOIN, order of the table doesn't matter. since we get the same results, order is not important for INNER JOIN.
--  Get all customers along with their orders, but only for customers who have placed any order" 

SELECT * 
FROM customers;

SELECT * 
FROM orders;

USE MyDatabase;

SELECT * 
FROM customers 
INNER JOIN orders
ON customers.id = orders.customer_id; 

SELECT * 
FROM customers 
INNER JOIN orders 
ON orders.customer_id = customers.id;

-- or 

SELECT 
id,
first_name,
order_id,
sales
FROM customers 
INNER JOIN orders 
ON id = customer_id;

SELECT 
	customers.id,
	customers.first_name,
	orders.order_id,
	orders.sales
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id;

-- if you change the tables or if you change the order of keys also, we get the same results.
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o
INNER JOIN customers AS c 
ON c.id = o.customer_id;

--LEFT JOIN : All the rows from the left table and only matching from the right table. Left table is the primary source of the data.
--The order of the tables is important here.

SELECT * 
FROM A          -- FROM clause uses the left table because this is the main table (or starting table)
LEFT JOIN B     -- join with right table 
ON A.key = B.key 

--TASK:  Get all customers along with their orders, including those without orders.
-- Tables order is important 
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;


-- RIGHT JOIN: Returns all the rows from right and only matching from left table (opposite of LEFT JOIN) 
-- Right table is the primary source of the data 
-- Left table is secondary for additional data

--TASK: Get all customers along with their orders, including orders without matching customers.
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;

--TASK: Get all customers along with their orders, including orders without matching customers (using LEFT JOIN) 

SELECT * FROM customers;
SELECT * FROM orders;

--if possible use only LEF JOIN instead of RIGHT JOIN. When necessary change the tables order so you can use LEFT JOIN
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o
LEFT JOIN customers AS c
ON c.id = o.customer_id

--FULL JOIN : Returns everything from both the tables (all the rows matching and unmatching). 
--TASK: Get all customers and all orders, even if there's no match.
SELECT 
	c.id,
	c.first_name,
	o.order_id,
	o.sales
FROM orders AS o
FULL JOIN customers AS c
ON c.id = o.customer_id

--LEFT ANTI JOIN : Returns rows from left that has no match in right 
-- left able is primary source of data, right table is for lookup (filter),not for data
-- WHERE clause key must be from right table (B.key) 
SELECT * 
FROM A
LEFT JOIN B 
ON A.key = B.key 
WHERE B.key IS NULL

--TASK: Get all customers who haven't placed any order.

SELECT * 
FROM customers;

SELECT * 
FROM orders;

SELECT *
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.id=o.customer_id 
WHERE o.customer_id IS NULL

--RIGHT ANTI JOIN : Return rows from the right table that has no match in left table (opposite to LEFT ANTI JOIN)
-- Right table = orders 
-- Left table = customers 

-- Right table is primary (main source of data) 
-- Left table is used to lookup (filter), not for data.
-- WHERE clause key must be from left table (A.key) [IS NULL]

--TASK : Get all orders without matching customers 

SELECT *
FROM customers AS c 
RIGHT JOIN orders AS o 
ON c.id=o.customer_id 
WHERE c.id IS NULL

--TASK : Get all orders without matching customers using LEFT JOIN (just switch the tables and join) 
SELECT * 
FROM B
LEFT JOIN A
ON A.key = B.key
WHERE A.key IS NULL

SELECT * 
FROM customers;

SELECT * 
FROM orders;

-- Return row id must be 6
SELECT * 
FROM orders AS o 
LEFT JOIN customers AS c
ON c.id = o.customer_id
WHERE c.id IS NULL

--FULL ANTI JOIN: Returns the rows that dont match in either tables (The order of the tables doesn't matter here) 

SELECT * 
FROM A 
FULL JOIN B 
ON A.key = B.key 
WHERE 
B.key IS NULL OR A.key IS NULL

--TASK: Find customers without orders and orders without customers 

SELECT * 
FROM customers;

SELECT * 
FROM orders;

SELECT * 
FROM orders AS o FULL JOIN customers AS c 
ON c.id = o.customer_id
WHERE c.id IS NULL OR o.customer_id IS NULL

--TASK : Get all customers along with their orders, but only for customers who have placed an order without using INNER JOIN
-- In other words - Get all customers who have placed an order 
SELECT * 
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.id = o.customer_id
WHERE o.customer_id IS NOT NULL

--CROSS JOIN: Combines every row from left with every row from right. All possible combinations - Cartesian join.
-- Since the order of table doesn't matter, no condition needed.
SELECT * 
FROM A 
CROSS JOIN B

--TASK : Generate all possible combinations of customers and orders 
SELECT *
FROM customers 
CROSS JOIN orders