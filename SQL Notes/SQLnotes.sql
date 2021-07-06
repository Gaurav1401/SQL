USE sql_store;

SELECT * -- It is not good for large databases as millions of records are there
FROM customers
-- WHERE customer_id = 2
ORDER BY last_name;

-- The order of the selected column matters
SELECT first_name, last_name
FROM customers;

-- Indentation is required to make the code easier to read
SELECT 
	first_name, 
    last_name, 
    points, 
    points*100 -- Mathematical calculations on a column
FROM customers;

SELECT 
	first_name, 
    last_name, 
    points, 
    points*100 AS "User Bonus" -- Aliasing to make the column name understandable
FROM customers;

-- To avoid duplicates from a column
SELECT DISTINCT state
FROM customers;

SELECT 
	name,
    unit_price,
    unit_price * 2 AS "new price"
FROM products;

-- Filtering data on the basis of <, >, <>/!=, <=, >=
SELECT *
FROM customers
WHERE points > 1000;

SELECT *
FROM customers
WHERE state = 'CA';

SELECT *
FROM customers
WHERE birth_date > '1980-01-01';

SELECT *
FROM customers
WHERE state <> 'CA';
-- Query the orders that were placed after the year 2018
SELECT *
FROM orders
WHERE order_date > "2018-12-31";

-- Filtering data based on multiple conditions
SELECT * 
FROM customers
WHERE (birth_date > '1980-02-05' OR points > 1000) AND state = 'VA';
-- Precedence is AND > OR > NOT

SELECT *
FROM order_items
WHERE order_id = 2 AND (quantity * unit_price > 30); 

-- Get the data of the customers who reside in VA, GA & FL
SELECT * 
FROM customers 
WHERE state = 'VA' OR state = 'GA' OR state = 'FL';
-- Doing the above same thing using IN operator
SELECT * 
FROM customers 
WHERE state IN ('VA', 'GA', 'FL'); -- It is used in multiple OR condition just as isin method of pandas

-- From the products table
-- Return products with quantity in stock equal 49, 38, 72.
SELECT *
FROM products 
WHERE quantity_in_stock IN (49, 38, 72);

-- To get data over a range of values
SELECT *
FROM customers
WHERE points >= 1000 AND points <= 3000;
-- Use BETWEEN to do the same thing as above
SELECT *
FROM customers
WHERE points BETWEEN 1000 AND 3000;

-- Which customers born b/w 1st Jan 1990 & 1st Jan 2000
SELECT *
FROM customers
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';

-- To get a string following particular pattern
-- LIKE operator is used
SELECT * 
FROM customers
WHERE first_name LIKE "b%"; -- Selecting customers whose first name starts with b

SELECT * 
FROM customers
WHERE last_name LIKE "%b%"; -- Selecting customers which have b anywhere in the last name

SELECT *
FROM customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

SELECT *
FROM customers
WHERE phone LIKE '%9';

-- REGEXP is more flexible than LIKE operator
SELECT *
FROM customers
WHERE last_name REGEXP '^MY[a-z]' OR last_name REGEXP 'SE'; -- It gives the record of customers whose last_name either starts with "my" or contains "SE"

SELECT *
FROM customers
WHERE last_name REGEXP 'b[ru]'; -- last_name contains b followed by r or u

SELECT *
FROM customers
WHERE first_name REGEXP 'ELKA|AMBUR';

SELECT *
FROM customers
WHERE last_name REGEXP '[a-z]ey$' OR last_name REGEXP '[a-z]ON$'; -- last_name ends with ey or on

-- Selecting NULL values using IS NULL:
SELECT *
FROM customers
WHERE phone IS NULL;
 
 SELECT *
FROM customers
WHERE phone IS NOT NULL; -- Selecting NON NULL values

-- Identify the orders that are not shipped yet
SELECT *
FROM orders
WHERE shipped_date IS NULL;

-- Arranging the table in a particular order with respect to a column
SELECT * 
FROM order_items
WHERE order_id = 2
ORDER BY unit_price*quantity DESC;

-- What if you want a particular number of records
SELECT *
FROM customers
LIMIT 3; -- Will give only 3 records

SELECT *
FROM customers
LIMIT 5, 3; -- It will show 3 records after the 5th record

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

-- Understanding Inner JOIN
SELECT order_id, ord.product_id, name, ord.unit_price
FROM order_items AS ord
JOIN products AS pro ON pro.product_id = ord.product_id;

-- Join data from multiple databases
SELECT o.order_id, p.product_id, quantity, o.unit_price
FROM order_items o
JOIN sql_inventory.products p ON p.product_id = o.product_id;

-- SELF JOIN
USE sql_hr;

SELECT *
FROM employees;

SELECT 
	e.employee_id, 
	e.first_name AS employee_name,
    m.first_name AS Manager,
    m.employee_id AS Manager_id
FROM employees e
JOIN employees m ON m.reports_to =  e.employee_id;

-- Joining multiple tables
USE sql_invoicing;

SELECT p.payment_id, p.amount, pm.name, c.name, c.state
FROM payments p 
JOIN payment_methods pm ON p.payment_id = pm.payment_method_id
JOIN clients c ON c.client_id = p.client_id;

-- Compound JOIN Statement
USE sql_store;
-- in oirder items table order_id and product_id both contains duplicates
-- So, a combination of order_id and product_id is used to join the tables
SELECT *
FROM order_items oi
JOIN order_item_notes oin
	ON oi.order_id = oin.order_id
    AND oi.product_id = oin.product_id;
    
-- LEFT and RIGHT join
SELECT c.first_name,
		c.last_name,
        c.customer_id,
        o.order_id
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY c.customer_id; -- In this inner join we are getting only those customers who have placed some orders

-- What if we want the details of even those customers who did not place any order
SELECT c.first_name,
		c.last_name,
        c.customer_id,
        o.order_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id;
-- OUTER JOIN on multiple tables
-- IT will give the records of all those customers whether they haave orderred anything or there order was shipped or not.
SELECT c.first_name,
		c.last_name,
        c.customer_id,
        o.order_id,
        sh.shipper_id
FROM customers c
LEFT JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON sh.shipper_id = o.shipper_id;

SELECT o.order_id,
		o.order_date,
        c.first_name AS customer,
        sh.name AS shipper_name,
        os.name AS status_of_order
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
	ON sh.shipper_id = o.shipper_id
JOIN order_statuses os
	ON os.order_status_id = o.status;

USE sql_invoicing;

SELECT p.date,
		c.name AS customers,
        p.amount,
        pm.name AS payment_method
FROM payments p
JOIN clients c
	USING (client_id)
JOIN payment_methods pm
	ON pm.payment_method_id = p.payment_method;
    
USE sql_store;

-- If there are 2 tables each of having 10 records
-- Then cross join will give you 100 records
SELECT
	c.first_name,
    p.name AS product
FROM customers c
CROSS JOIN products p
ORDER BY c.first_name; 

-- This will also give the same output
SELECT
	c.first_name,
    p.name AS product
FROM customers c, products p
ORDER BY c.first_name; 

SELECT customer_id, 
		first_name,
        points,
        'Bronze' AS "Type"
FROM customers
WHERE points < 2000
UNION
SELECT customer_id, 
		first_name,
        points,
        'Silver' AS "Type"
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id, 
		first_name,
        points,
        'Gold' AS "Type"
FROM customers
WHERE points > 3000
ORDER BY first_name;

USE sql_store;
-- INSERTING
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('Product 1', 5, 1.50), ('Product 1', 5, 1.50), ('Product 1', 5, 1.50);

SELECT * FROM products;

-- Creating a copy of table
CREATE TABLE order_copy AS 
SELECT * FROM orders;

-- Creating a copy of table WITH particular condition
INSERT INTO order_copy
SELECT *
FROM orders
WHERE order_date < '2019-01-01';

-- Understanding Subqueries
UPDATE orders
SET comments = 'GOLD customers'
WHERE customer_id IN 
			(SELECT customer_id 
			FROM customers c
			WHERE points > 3000);
            
-- Aggregate Functions 
-- The most common are: MAX(), MIN(), AVG(), COUNT()
-- ROLLUP
SELECT client_id,
		SUM(invoice_total) AS total
FROM invoices
GROUP BY client_id WITH ROLLUP;
-- it add an extra row having total sum of the whole column having aggregate function

USE sql_store;
-- Find the products that are
-- more expensive than lettuce (the id of lettuce is 3)
SELECT *
FROM products
WHERE unit_price >
		(SELECT unit_price
        FROM products
        WHERE product_id = 3);
        
-- Find products that were never ordered
SELECT product_id
FROM products
WHERE product_id NOT IN (
		SELECT DISTINCT product_id
        FROM order_items
);

USE sql_invoicing;
-- SELECT invoices that are larger than all the invoices of Client 3
SELECT *
FROM invoices
WHERE invoice_total > ALL( -- ALL keyword is used to make comparison with a column
	SELECT invoice_total
    FROM invoices
    WHERE client_id = 3
);

USE sql_hr;

SELECT *
FROM employees e
WHERE salary < (
	SELECT AVG(salary)
    FROM employees
    WHERE e.office_id = office_id
);


-- Using subquery in select statement
USE sql_invoicing;
SELECT
	invoice_id, 
    invoice_total,
    (SELECT AVG(invoice_total)
		FROM invoices) AS invoice_average,
	invoice_total - (SELECT invoice_average) AS	difference -- I can't directly write invoice_average here
FROM invoices;

-- Essential MYSQL functions
-- Numeric Functions

SELECT ROUND(3.45);

SELECT ROUND(3.45345, 1); -- It will retain the first value after the decimal and will round off the rest

SELECT TRUNCATE(3.45678, 2); -- Will retain only 2 values after the decimal and will eliminate the rest

SELECT CEILING(4.2);

SELECT FLOOR(2.8);

SELECT ABS(-2);

SELECT RAND(); -- Will generate random number between 0 and 1

-- String Functions

SELECT LENGTH('Gaurav'); 

SELECT UPPER('Gaurav'); -- Will convert to UPPERCASE()

SELECT LTRIM(' Gaurav'); -- Will remove unwanted spaces from left side

SELECT RTRIM(' Gaurav'); -- Will remove unwanted spaces from right side

SELECT TRIM(' Gaurav '); -- Will remove unwanted spaces from both sides

SELECT LEFT('Gaurav', 3); -- Will return first 3 alphabets from the left of string

SELECT RIGHT('Gaurav', 3); -- Will return last 3 alphabets from the string

SELECT SUBSTRING('Gaurav', 3, 3); -- (String, Start, No. of characters from start)

SELECT LOCATE('z' , 'Gaurav'); -- Will return 0 if character is not present in the string

SELECT REPLACE('Gaurav','rav','var'); 

SELECT CONCAT('Gaurav',' ','Kumar');

-- Datetime Functions

SELECT NOW(), CURDATE(), CURTIME();

SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW());

-- When you don't want to see null values in your column
USE sql_store;

SELECT 
	order_id,
    COALESCE(shipper_id, comments, 'Not Assigned') AS shipper -- if shipper_id is null then it will replace them with comments and if they are also null then 'not assigned'
FROM orders;

-- IF Statement in sql
-- IF (expression, First, Second)

SELECT
	order_id,
    order_date,
    IF(YEAR(order_date) > '2018-01-01', 'Active', 'Archived')
FROM orders;

-- If you have multiple test expression to evaluate then use CASE

SELECT order_id,
		order_date,
        CASE 
			WHEN YEAR(order_date) >= '2019-01-01' THEN 'CURRENT ORDERS'
            WHEN YEAR(order_date) = '2018-01-01' THEN 'ACTIVE ORDERS'
            WHEN YEAR(order_date) < '2018-01-01' THEN 'ARCHIVED ORDERS'
		ELSE 'Future'
	END AS Category
FROM orders;

