USE learning;

-- CONSTRAINTS
-- UNIQUE
-- NOT NULL
-- CHECK
--  DEFAULT
-- PRIMARY KEY
 -- FOREIGN KEY
 
 -- UNIQUE CONSTRAINT
 
CREATE TABLE unique_table(
custid INT UNIQUE,
custname varchar(50),
age int, 
city varchar(50)
 );
 
 SELECT * FROM unique_table;
 
INSERT INTO unique_table Values(101, 'Sonal', 27, 'Dombivli'); 

INSERT INTO unique_table Values(102, 'Sakshi', 20, 'Dombivli');

INSERT INTO unique_table (custname, age,city) Values('Sakshi', 20, 'Dombivli');

INSERT INTO unique_table (custname, age,city) Values('Sakshi', 20, 'Dombivli');

SELECT * FROM unique_table;
desc unique_table;
-- ============================================

-- NOT NULL CONSTRAINTS

CREATE TABLE nn_table(
 custid INT NOT NULL,
 custname VARCHAR(100),
 age int,
 city varchar(100)
 );
SELECT * FROM nn_table;
desc nn_table;

INSERT INTO nn_table VALUES(101, 'Sonal', 27, 'Kalyan');
INSERT INTO nn_table (custname, age, city) VALUES('Sonal', 27, 'Kalyan');
INSERT INTO nn_table (custid,age, city) VALUES(102, 27, 'Kalyan');
INSERT INTO nn_table (custid,custname, city) VALUES(102, 'Sonal', 'Kalyan');
INSERT INTO nn_table (custid,custname,age) VALUES(102, 'Sonal', 27);

delete from nn_table where custname = '27';

SELECT * FROM nn_table;

-- ===========================
CREATE TABLE nn_uniq_table(
 custid INT UNIQUE NOT NULL,
 custname VARCHAR(100),
 age int,
 city varchar(100)
 );
 
 select *from nn_uniq_table;
 
INSERT INTO nn_uniq_table values(101, 'Sonal', 27, 'Kalyan');

INSERT INTO nn_uniq_table values(101, 'Sonal', 27, 'Kalyan');
INSERT INTO nn_uniq_table values(102, 'Sonal', 27, 'Kalyan');
SELECT  * FROM nn_uniq_table;
 
INSERT INTO nn_uniq_table (custname, age, city) values('Sonal', 27, 'Kalyan');

INSERT INTO nn_uniq_table (custid,custname, age, city) values(102, 'Sonal', 27, 'Kalyan');
INSERT INTO nn_uniq_table (custid,custname, age, city) values(103, 'Sonal', 27, 'Kalyan');
SELECT  * FROM nn_uniq_table;

-- =======================================
-- check 

CREATE TABLE check_table(
 custid INT ,
 custname VARCHAR(100),
 age INT CHECK (age > 0 and age<=100),
 city varchar(100)
 );
 
 SELECT * FROM check_table;
 
INSERT INTO check_table VALUES (101, 'Rajni', 30, 'Banglore');
INSERT INTO check_table VALUES (102, 'Rajni', 320, 'Banglore');
INSERT INTO check_table VALUES (102, 'Rajni', -1, 'Banglore');
-- -------------------------
CREATE TABLE check_table2(
 custid INT ,
 custname VARCHAR(100),
 age INT ,
 city varchar(100) CHECK (city in ('Pune', 'Hyderabad', 'Kalyan'))
 );

SELECT * FROM check_table2;

INSERT INTO check_table2 VALUES(101, 'Kumar', 20, 'Pune');
INSERT INTO check_table2 VALUES(101, 'Kumar', 20, 'Kalyan');
INSERT INTO check_table2 VALUES(101, 'Kumar', 20, 'Hyderabad');
INSERT INTO check_table2 VALUES(101, 'Kumar', 20, 'Nagpur')
INSERT INTO check_table2 (custid,custname,age) VALUES(101, 'Kumar', 20)
SELECT * FROM check_table2;

-- ========================================

-- DEFAULT constraint

CREATE TABLE default_table(
custid INT,
custname VARCHAR(100),
age INT,
city VARCHAR(20) DEFAULT 'Pune'
);
SELECT * FROM default_table;
INSERT INTO default_table VALUES(100,'Satya',35,'Mumbai');

SELECT * FROM default_table;

INSERT INTO default_table(custid, custname, age) VALUES(1001,'Aveek Sharma',45);
SELECT * FROM default_table;


