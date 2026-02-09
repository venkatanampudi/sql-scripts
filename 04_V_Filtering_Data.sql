--- ***** FILTERING THE DATA  ***** ---
-- Comparision Operators

/* 
=           checks if two values are equal 
<> or  !=   checks if two values are not equal 
>           greaterthan the other value
>=          greater than or equal to 
<           less than 
<=          less than or equal to
*/

USE MyDatabase;
SELECT * 
FROM customers
WHERE country != 'Germany';

SELECT * 
FROM customers
WHERE country <> 'USA';

SELECT * 
FROM customers 
WHERE score > 500;

SELECT * 
FROM customers 
WHERE score >= 500;

-- LOGICAL OPERATORS (AND,OR,NOT )
-- AND ==> All conditions must be TRUE 
-- OR  ==> At least one condition must be TRUE 
-- NOT ==> (Reverse) Excludes the matching valu

USE MyDatabase;
SELECT * FROM customers;

SELECT * 
FROM customers
WHERE country = 'Germany' AND score > 500;

/* Retrieve all the customers who are from USA and have a score greater than 500. */
SELECT * 
FROM customers
WHERE country = 'USA' AND score > 500;

/* Retrieve all the customers who are from USA and either have a score greater than 500. */
SELECT * 
FROM customers 
WHERE country = 'USA' OR score > 500;

SELECT * 
FROM customers 
WHERE country = 'UK' OR score < 500;

/* Retrieve all the customers with score NOT less than 500. */
SELECT * 
FROM customers 
WHERE NOT score < 500;

-- RANGE OPERATOR (BETWEEN) 
-- Boundaries inclusive 
-- checks the value within a range (inclusive) 
SELECT * 
FROM customers 
WHERE score BETWEEN 100 AND 500;

--Same we can write with "AND" 
SELECT * 
FROM customers 
WHERE score >= 100 AND score <=500;

--Membership operators (IN, NOT IN) 
-- IN ==>     Checks if a value exists in a list 
-- NOT IN ==> checks if value NOT IN a list 

SELECT * 
FROM customers 
WHERE country IN ('Germany','USA')

SELECT * 
FROM customers 
WHERE country NOT IN ('Germany','USA')

--Search Operator (LIKE)
/*
LIKE is used to search for a pattern in the text 
% meaning anything or any number of chars 
_     ==> exactly one char  (underscore)
M%    ==> first char must be 'M' then any number of chars (ex: Maria) 
%in   ==> Any chars and last chars must be "in" (Martin, Vin,in). Jasmine is not correct.
%r%   ==> if char "r" is any where in the text, it good enough. Like in Maria,Peter, Mary, Ryan, R  but not in Venkat or in Alice
__b%  ==> Albert, Rob. Not in Abel or in An as well. char 'b' in 3rd position
*/

-- Find all the customers whose first name starts with 'M'
SELECT * 
FROM customers 
WHERE first_name LIKE 'M%'

-- Find all the customers whose first name ends with 'n'
SELECT * 
FROM customers 
WHERE first_name LIKE '%n'

-- Find all the customers whose first name contains 'r' (anywhere)
SELECT * 
FROM customers 
WHERE first_name LIKE '%r%';

-- Find all the customers whose first name has 'r' in the third position.
SELECT * 
FROM customers 
WHERE first_name LIKE '__r%';