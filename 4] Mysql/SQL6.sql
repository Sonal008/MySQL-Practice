USE learning;

-- JOINS: CONNECT MULTIPLE TABLES

-- INNER JOIN
-- OUTER JOIN
 -- LEFT JOIN
 -- RIGHT JOIN
 -- FULL JOIN
-- SELF JOIN

CREATE TABLE cust_table(
cust_id INT PRIMARY KEY,
cust_name varchar(100),
city VARCHAR(100)
);

INSERT INTO cust_table VALUES (101,'Rajesh', 'Kolkata'),
							  (102,'Ramesh','Delhi'), 
							  (103,'Neha','Bangalore'),
                              (104, 'Sneha', 'Chennai');

SELECT * FROM cust_table;

CREATE TABLE trans_table(
cust_id INT,
trans_id INT PRIMARY KEY,
prodname VARCHAR(100),
amt INT
);

INSERT INTO trans_table VALUES (101,1,'Air Conditioner',40000),
                    (102,2,'Bike',55000), 
                    (103,3,'Mobile',25000),
                    (104,4,'Cooler',10000),
                    (105,5,'Television',30000),
                    (106,6,'Mixer',15000),
                    (107,7,'Iron',5000);
SELECT * FROM trans_table;
-- ===========================
-- INNER JOIN ----
-- takes only common records and ignore other
-- doesn't take not matching record
SELECT * FROM cust_table c INNER JOIN trans_table t ON c.cust_id = t.cust_id;

SELECT c.cust_name, c.cust_id, t.prodname, t.amt FROM cust_table c INNER JOIN trans_table t ON c.cust_id = t.cust_id;

SELECT * FROM cust_table c INNER JOIN trans_table t ON c.cust_id = t.cust_id;

SELECT c.cust_name, c.city, t.amt FROM cust_table c INNER JOIN trans_table t ON c.cust_id = t.cust_id WHERE amt >20000;

-- ==============================================
-- ==================== OUTER JOIN =========== --
-- LEFT JOIN
-- TABLE on left records are taken only rest are null
-- match reords are taken
-- unmatched of only left table are taken 
SELECT * FROM cust_table;  -- 4 RECORDS
SELECT * FROM trans_table; -- 7 RECORDS

SELECT * FROM cust_table c LEFT JOIN trans_table t ON c.cust_id = t.cust_id;  
SELECT * FROM trans_table t LEFT JOIN cust_table  c ON c.cust_id = t.cust_id;  
SELECT c.cust_name, t.prodname FROM cust_table  c LEFT JOIN trans_table t ON c.cust_id = t.cust_id;  

SELECT * FROM  trans_table t LEFT JOIN  cust_table c ON c.cust_id=t.cust_id WHERE c.cust_id IS NULL;
-- ===================================================================================================

-- RIGHT JOIN
-- TABLE on right records are taken only rest are null
-- match reords are taken
-- unmatched of only right table are taken 

SELECT * FROM cust_table;
SELECT * FROM trans_table;

SELECT * FROM cust_table c RIGHT JOIN trans_table t ON c.cust_id = t.cust_id;
SELECT * FROM trans_table t RIGHT JOIN cust_table c ON c.cust_id = t.cust_id;

SELECT * FROM cust_table c RIGHT JOIN trans_table t ON c.cust_id = t.cust_id WHERE c.city IS NULL;

-- ===========================================================================
-- FULL JOIN 
-- Condition less join 
-- only join

SELECT * FROM cust_table;
SELECT * FROM trans_table;

SELECT * FROM cust_table c JOIN trans_table t;

SELECT * FROM trans_table t JOIN cust_table c;
-- ============================================================================
-- SELF JOIN
CREATE TABLE stud_table(
sname VARCHAR(100),
s_id INT,
sub VARCHAR(100),
marks INT
);

CREATE TABLE employee_table(
emp_id INT,
ename VARCHAR(100),
salary INT,
mgr_id int);

INSERT INTO employee_table VALUES(1,'Ramesh',10000,5);
INSERT INTO employee_table VALUES(2,'Guna',12000,5);
INSERT INTO employee_table VALUES(3,'Sridhar',20000,5);
INSERT INTO employee_table VALUES(4,'Pankaj',25000,5);
INSERT INTO employee_table VALUES(5,'Mohan',15000,6);
INSERT INTO employee_table VALUES(6,'Siva',14000,6);

SELECT * FROM employee_table;

SELECT e1.ename as emp_name 
FROM employee_table e1 JOIN employee_table e2
ON e1.mgr_id = e2.emp_id WHERE e1.salary > e2.salary;






-- ============================================================================