-- ===================== STRING FUNCTION ==============
USE learning;

SELECT * FROM customer; 

SELECT custname, LENGTH(custname) FROM customer;

SELECT custname, CHARACTER_LENGTH(custname) FROM customer;

-- CONCAT--
SELECT * FROM customer;

SELECT CONCAT(custname,'-',location) FROM customer;

SELECT CONCAT(custname, '-', location) AS cust_info FROM customer; 
-- column name change

SELECT CONCAT(custid,  '-' , custname, '-', location) AS cust_info FROM customer; 

SELECT CONCAT_WS('-', custid,custname,location) AS cust_info FROM customer;
-- put '-' only once

-- ======================================
-- FORMAT
SELECT * FROM customer;

SELECT FORMAT (1234567890,2);

SELECT FORMAT (1234567890,1);
-- =========================================
-- UPPER , UPCASE, LOWER, LCASE --

SELECT * FROM customer;

SELECT custname, UPPER(custname) FROM customer;

SELECT custname, UCASE(custname), Upper(location) FROM customer;

SELECT custid, LOWER(custname), LCASE(location) FROM customer;

-- ===============================================
-- LIKE
 SELECT * FROM customer;
 
SELECT * FROM customer WHERE custname LIKE'M%';

SELECT * FROM customer WHERE custname LIKE'%I';

SELECT * FROM customer WHERE custname LIKE'M%I';

SELECT * FROM customer WHERE custname LIKE '%NI%';

SELECT * FROM customer WHERE location LIKE 'h%' OR location LIKE 'b%';
-- AND DOESNT WORKED

SELECT * FROM customer WHERE location LIKE '%B_D';

-- =================================

-- REVERSE

SELECT custname , REVERSE (custname) 
AS r_name FROM customer WHERE custname LIKE 'S%L';
-- ======================================
-- REPEAT 
SELECT REPEAT('Chennai', 2);

-- REPLACE
SELECT location, REPLACE(location, 'e','E') AS replaced FROM customer;
