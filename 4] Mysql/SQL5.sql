USE learing;

-- PRIMARY KEY
--  Primary key column is used to identify each record in a table uniquely
-- No null and duplicate value accepted
-- only one column can be primary  

CREATE TABLE pk_table(
empid INT primary key,    -- Simple primary key 
empname varchar(100),
gender char(1),
age int,
city varchar(50)
);

SELECT * FROM pk_table;
DESC pk_table;

INSERT INTO pk_table VALUES(100, 'Sonal','F', 27, 'Pune');
INSERT INTO pk_table VALUES(100, 'Sonal','F', 27, 'Pune');
INSERT INTO pk_table VALUES(101, 'Sonal','F', 27, 'Pune');
INSERT INTO pk_table (empname, gender, age, city) VALUES('Sonal','F', 27, 'Pune');
INSERT INTO pk_table(empid,empname,gender,age,city) VALUES(103,'Guna','M',38,'Bangalore'); 
SELECT * FROM pk_table;

-- ------------------------------------
-- Composite primary key can take multiple columns
-- But all those columns cannot be same at same time
-- Composite primary key column cannnot be null
CREATE TABLE comp_pk_table(
empid INT ,    
empname varchar(100),
gender char(1),
age int,
city varchar(20),
PRIMARY KEY (empid,empname)  -- composite primary key
);

SELECT * FROM comp_pk_table;
INSERT INTO comp_pk_table VALUES(100,'Durga','F',30,'Chennai');

INSERT INTO comp_pk_table VALUES(100,'Durga','F',30,'Chennai');
INSERT INTO comp_pk_table VALUES(101,'Durga','F',30,'Chennai');
SELECT * FROM comp_pk_table;

INSERT INTO comp_pk_table VALUES(101,'Divya','F',30,'Chennai');

INSERT INTO comp_pk_table(empname,gender,age,city) VALUES('Guna','M',38,'Bangalore');  -- ERROR since empid does not have a value

INSERT INTO comp_pk_table(empid,empname,gender,age,city) VALUES(1002,'Guna','M',38,'Bangalore'); 

SELECT * FROM comp_pk_table;

DESC comp_pk_table;


-- ==========================================
-- FOREIGN KEY
-- two tables: parent and child
-- one table will have reference to other table with common column

create table customer_table(
cust_id INT PRIMARY KEY,
custname VARCHAR(20),
gender CHAR(1),
age INT,
city VARCHAR(20)
);

SELECT  * FROM customer_table;

create table order_table(
order_id INT PRIMARY KEY,
cust_id INT,
prodname VARCHAR(100),
amount DECIMAL(20,2),
FOREIGN KEY (cust_id) REFERENCES customer_table(cust_id)
);

SELECT  * FROM order_table;

INSERT INTO customer_table VALUES(100,'Bala','M',30,'Bangalore'),
                                 (101,'Prabha','M',35,'Hyderabad'),
                                 (102,'Saran','M',25,'Chennai');

INSERT INTO order_table VALUES (1, 100, 'TV', 20000);
INSERT INTO order_table VALUES (2, 103, 'Iron', 20000);  -- no custid present in parent table
INSERT INTO order_table VALUES (2, 100, 'Iron', 20000);
INSERT INTO order_table VALUES (2, 100, 'Iron', 20000); -- duplicate order_id no accepted as its primary key
SELECT  * FROM order_table;

INSERT INTO order_table VALUES (3, 102, 'Desktop', 25000);
INSERT INTO order_table VALUES (3, 101, 'Mobile', 34000);

SELECT  * FROM order_table;
SELECT  * FROM customer_table;

DELETE FROM customer_table WHERE cust_id = 102;  -- CANNOT DELETE FROM PARENT table since id is present in child table

DELETE FROM order_table WHERE cust_id = 102; -- delete first from child table

DELETE FROM customer_table WHERE cust_id = 102;

-- ================================
-- on delete cascade helps to delete record direct from parent table
CREATE TABLE parent_table(
id INT PRIMARY KEY,
cname VARCHAR(100)
);

SELECT * FROM parent_table;
INSERT INTO parent_table VALUES (100, 'Amazon'),
                         (101, 'Flipkart'),
						 (102,'Linkedin');
RENAME TABLE parent_table TO p_table;
SELECT * FROM p_table;

CREATE TABLE emp_table(
emp_id INT PRIMARY KEY,
comp_id INT,
name VARCHAR(100),
FOREIGN KEY (comp_id) REFERENCES p_table(id) ON DELETE CASCADE 
);

SELECT * FROM emp_table;

INSERT INTO emp_table VALUES (1, 100, 'Ram'), 
                             (2, 101, 'Rohan'), 
                             (3, 102, 'Hima');

DELETE FROM p_table WHERE id = 102;

SELECT * FROM p_table;

SELECT * FROM emp_table;

set sql_safe_updates= 0;

UPDATE p_table SET cname = 'GoldmanSach' WHERE id = 101;
UPDATE p_table SET id = 101 WHERE cname = 'Amazon';

