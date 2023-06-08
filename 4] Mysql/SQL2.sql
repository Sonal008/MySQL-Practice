Use learning;

-- LOAD DATA (INSERT) -----
CREATE TABLE customer (
custid INT,
custname VARCHAR(50),
age INT,
gender CHAR(1),
city VARCHAR(50)
);

Select * from customer;

INSERT INTO customer VALUES(1000,'Sonal', 27, 'F', 'Chennai');
INSERT INTO CUSTOMER VALUES(1001,'Revati',20,'F','Hyderabad');

INSERT INTO CUSTOMER(custid, custname, gender, city) VALUES(1002,'Malini','F','Bangalore');
INSERT INTO customer(city,custname,gender,custid,age) VALUES('Pune','Pankaj Kumar','M',1003,40);

INSERT INTO CUSTOMER VALUES(1004,'Mohan Kuamr',37,'M','Chennai'),(1005,'Sivanandam',50,'M','Delhi'),(1006,'Ranga',55,'M','Chennai');

INSERT INTO CUSTOMER(custid, custname,gender,city) VALUES(1007,'Raj S','M','Pandicherry');
SELECT * FROM customer;

-- =================================================================================

-- UPDATE statement

-- SAFE MODE disable
SET sql_safe_updates=0;

SELECT * FROM customer;

UPDATE customer SET age=30 WHERE custid=1002;

UPDATE customer SET age=60 WHERE custid=1007;

UPDATE customer SET custid=2000 WHERE custid=1006;

UPDATE customer SET age=41, city='Hyderabad' WHERE custid=1003;

SELECT * FROM customer;

INSERT INTO CUSTOMER(custname, age, gender, city) VALUES('Aveek Sharma',45,'M','Hyderabad');

UPDATE customer SET custid=1008 WHERE custid IS NULL;

SELECT * FROM customer;

-- =================================================================================

-- DELETE statement --

DELETE FROM customer WHERE custname= 'Raj S';
 
SELECT * FROM CUSTOMER;
 
DELETE FROM customer WHERE age>30;


SELECT * FROM CUSTOMER;  

-- DELETE THE RECORD IF THE CUSTOMER ARE NOT FROM EITHER OR

DELETE FROM CUSTOMER WHERE city IN ('Bangalore');
 
DELETE FROM CUSTOMER WHERE city != 'Hyderabad';

DELETE FROM customer WHERE city NOT IN ('Chennai','Banglore');

SELECT * FROM CUSTOMER;