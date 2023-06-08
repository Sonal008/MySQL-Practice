-- ================ AUTO INCREMENT ============ --

CREATE TABLE country(
country_id INT PRIMARY KEY AUTO_INCREMENT,
countryname VARCHAR(20)
);

INSERT INTO country (countryname) VALUES('India');
INSERT INTO country (countryname) VALUES('Indonesia'),('Brazil');

SELECT * FROM country;
INSERT INTO country(countryname) VALUES('Finland');
INSERT INTO country VALUES(100,'Japan');
INSERT INTO country(countryname) VALUES('Europe');

set sql_safe_updates = 0;
DELETE FROM country where countryname =  'Europe';
DESC country;

ALTER TABLE country MODIFY COLUMN countryname VARCHAR(30);


-- =================== SUB QUERY ==================
USE training;


SELECT * FROM employees;

SELECT Department, First, Last, Status, Salary FROM employees 
WHERE Salary =(SELECT max(Salary) FROM employees);  -- sub query

SELECT Department, First, Last, Status,Salary FROM employees
WHERE Salary =(SELECT min(Salary) FROM employees);

-- ==================================================
-- DELETE Vs Truncate Vs Drop

USE learning;
SELECT * FROM cust_table;

SET SQL_SAFE_UPDATES=0;

DELETE FROM cust_table WHERE cust_id=103;  -- (delete a particular records)

DELETE FROM cust_table;   
-- (Delete entire table data but structure remains)
-- can roll back from delete- undo is possible only in DELETE

SELECT * FROM customer;

DELETE FROM customer WHERE age> 50;

SELECT * FROM pk_table;

TRUNCATE TABLE pk_table;  -- (Delete whole table data)

SELECT * FROM default_table;
DROP TABLE default_table;  -- (Delete both data as well as table)























