CREATE DATABASE STUDENT;

USE STUDENT;

SHOW DATABASES;

recordCREATE TABLE RECORD
(
ID INT,
Sname VARCHAR(50),
Age INT,
Gender CHAR(1),
City VARCHAR(50)
);

SELECT * FROM RECORD;
-- =================================================================================
                            -- (INSERT) DATA IN RECORD --
INSERT INTO RECORD VALUES(101, 'Sonal Sonawane', 27, 'F', 'Dombivli');
INSERT INTO RECORD VALUES(102, "Revati Sonawane", 20, "F", "Dombivli");
INSERT INTO RECORD VALUES(109,  "Vaibhav",51, 'M', "Satara"),
						 (110,  "Maya",26,'F', "Sangli"),
						 (111,  "Vasant",21, 'M', "Mumbai");

SELECT * FROM RECORD;
-- =================================================================================
								-- re-arranged columns --
INSERT INTO RECORD (ID, Age, Gender, Sname, City) VALUES(103, 54, 'M', "Chandrakant Sonawane", "Dombivli");

SELECT * FROM RECORD;
-- =================================================================================
                             -- missing data in columns --
INSERT INTO RECORD(ID, AGE, Sname, City) VALUES(104, 52, "Bharti Sonawane", "Worli");
INSERT INTO RECORD(ID, Gender, Sname, City) VALUES(105, 'F', "Priti Prakash", "Pune");
INSERT INTO RECORD(Age, Gender, Sname, City) VALUES(09, 'M', "Vedant", "Mumbai");
INSERT INTO RECORD(ID, Gender, Age, City) VALUES(107, 'F',19, "Thane");
INSERT INTO RECORD(ID, Gender, Age) VALUES(108, 'F',30);

SELECT * FROM RECORD;
-- =================================================================================
							-- (UPDATE) DATA IN RECORD --
                            -- Safe Mode Disabled --
SET SQL_SAFE_UPDATES = 0;

-- ADD NULL VALUES IN RECORD --
UPDATE RECORD SET Gender = 'F' WHERE ID = 104;
UPDATE RECORD SET City = 'Ghatkopar',  Sname = 'Neha' WHERE ID = 108;
UPDATE RECORD SET ID = 103 WHERE Sname = 'Vaibhav';
UPDATE RECORD SET Age = 46 WHERE Age IS Null;

SELECT * FROM RECORD;
-- =================================================================================
                            -- (DELETE) DATA IN RECORD --
DELETE FROM RECORD WHERE Age>50; 
DELETE FROM RECORD WHERE City = 'Mumbai';
DELETE FROM RECORD WHERE City IN ('Sangli', 'Pune');
DELETE FROM RECORD WHERE City NOT IN ('Thane', 'Ghatkopar');

SELECT * FROM RECORD;
-- =================================================================================
