CREATE DATABASE employee;

USE employee;

SHOW DATABASES;

CREATE TABLE Product(
ID INT,
Pname VARCHAR(100),
Amount INT
);

SELECT * FROM Product;
-- ============================================================================================
                             -- Create (Product) Database --
INSERT INTO Product VALUES(001,'Mobile',30000),
						  (002,'laptop',75000),
						   (003,'TV',60000),
                           (004,'Desktop',55000),
                           (005,'Fridge',30000);
                           
SELECT * FROM Product;
-- ============================================================================================
                               -- Import Company Database --
SELECT * FROM Company;

-- ===========================================================================================
                               -- View (Company) Database --
SELECT * FROM Company WHERE Company = 'TCS';

SELECT * FROM Company WHERE Company  = 'Infosys' AND Place ='Hyderabad';

SELECT * FROM company WHERE Place = 'Chennai' AND Salary > 5000;

SELECT * FROM Company WHERE Age < 25;

SELECT Company, Age FROM Company WHERE Age > 25;

SELECT * FROM Company WHERE Age < 20 AND Place='Calcutta';

SELECT * FROM Company WHERE Age < 20 OR Place='Calcutta';

-- =============================================================================================
                           -- (UPDATE) and (DELETE) Statement:
SELECT * FROM Company WHERE Place='';

-- =============================================================================================
							-- (UPDATE) DATA IN COMPANY DATABASE --
                            -- Safe Mode Disabled --
SET SQL_SAFE_UPDATES=0;

UPDATE Company SET Place ='New York'  WHERE Place='';

SELECT * FROM Company WHERE Place='';

SELECT * FROM Company WHERE Place='New York';

-- ===============================================================================================
                               -- View Product Database --
SELECT * FROM Product;

UPDATE Product SET Pname='Television' , Amount=100000 WHERE ID = 3;

SELECT * FROM Product;

SELECT * FROM Company;
-- ================================================================================================
							     -- (DELETE) RECORDS --

SELECT * FROM Product;
SELECT * FROM Product WHERE Pname='Fridge';
DELETE FROM Product WHERE Pname = 'Fridge';
SELECT * FROM Product;
-- ================================================================================================
							              -- CHECK CONSTRAINT --
-- UNIQUE
-- NOT NULL
-- CHECK 
-- DEFAULT
-- ==================================================================================================
										  -- UNIQUE CONSTRAINT --
CREATE TABLE Unique_table(
ID INT UNIQUE ,
CName VARCHAR(50),
Age INT,
City VARCHAR(50)
);

INSERT INTO Unique_table VALUES(100, 'Bhavesh',30,'Gujarat');
INSERT INTO Unique_table VALUES(102, 'Priya',20,'Chennai');                     -- Unique ID ERROR --
INSERT INTO Unique_table VALUES(102, 'Sneha',33,'Kolkata');
INSERT INTO Unique_table (CName, Age, City) VALUES('Sneha',33,'Kolkata');      -- Not Null ID is acepted in UNQIUE ---
SELECT * FROM Unique_table;

------------------------ INSERT NULL VALUES -------------------------------------------------------------------

INSERT INTO Unique_table(ID, CName) VALUES (103,'Heena');
INSERT INTO Unique_table(CName) VALUES ('Priya');
INSERT INTO Unique_table VALUES (NULL,NULL, 20, 'Pune');
SELECT * FROM Unique_table;
-- ===========================================================================================================                            
                                         -- NotNull CONSTRAINT --
CREATE TABLE NotNull_tables
(
ID INT UNIQUE NOT NULL,
CName VARCHAR(50) NOT NULL,
Age INT,
City VARCHAR(50)
);

INSERT INTO NotNull_tables VALUES (001, 'Sonal', 27, 'Thane');
INSERT INTO NotNull_tables VALUES (001, 'Sakshi', 24, 'Pune');                               -- Unique ID ERROR -- 
INSERT INTO NotNull_tables VALUES (NULL,'Siya', 20, 'Dombivli');                             -- Null CName ERROR --
INSERT INTO NotNull_tables VALUES (002,'Siya', 20, 'Dombivli'); 
INSERT INTO NotNull_tables (ID, CName, Age, City) VALUES (NULL,'Siya', 20, 'Dombivli');      -- Null ID ERROR --
INSERT INTO NotNull_tables (ID, CName, Age, City) VALUES (003,'Siya', 20, 'Dombivli'); 
INSERT INTO NotNull_tables VALUES (NULL, NULL, 20, 'Dombivli'); 
INSERT INTO NotNull_tables VALUES (004, 'Bharti', 20, 'Dombivli'); 
SELECT * FROM NotNull_tables;

-- =====================================================================================================
                                       -- CHECK CONSTRAINT --
CREATE TABLE Check_table
(
ID INT UNIQUE NOT NULL,
CName VARCHAR(100) NOT NULL,
Age INT CHECK (age > 0 and age<=100),
City VARCHAR(100)
);
INSERT INTO Check_table VALUES (1,'Siva', 30, 'Chennai');
INSERT INTO Check_table VALUES (1,'Venkatesh',36,'Hyderabad');                    -- ERROR since it is duplicate ID --
INSERT INTO Check_table(CName, Age, City) VALUES('Venkatesh',36,'Hyderabad');     -- ERROR since ID is NULL -- 
INSERT INTO Check_table VALUES (2,'Venkatesh',36,'Hyderabad');
INSERT INTO Check_table VALUES (3, 'Ramya', -1, 'Delhi');                             -- ERROR since age is < 0 -- 
INSERT INTO Check_table VALUES (3,'Ramya', 101, 'Delhi');                            -- ERROR since age is > 100 --
INSERT INTO Check_table VALUES (3, 'Ramya', 25, 'Delhi'); 
SELECT * FROM Check_table;
-- =================================================================================================
                                            -- DEFAULT CONSTRAINT --
CREATE TABLE Default_table
(
ID INT UNIQUE NOT NULL,
CName VARCHAR(100) UNIQUE,
Age INT CHECK (Age >= 22 AND Age <= 40),
City VARCHAR(100) DEFAULT 'Hyderabad'
);

INSERT INTO Default_table VALUES (1, 'Prakash', 25, 'Bangalore');
INSERT INTO Default_table VALUES (2, 'Priya', 20, 'Bangalore');                   -- ERROR since age is <=22
INSERT INTO Default_table VALUES (2, 'Priya', 50, 'Bangalore');                   -- ERROR since age is >= 40
INSERT INTO Default_table VALUES (2, 'Priya', 30, 'Bangalore'); 
SELECT * FROM Default_table;

INSERT INTO Default_table(ID, CName, Age) VALUES (3,'Satya',35);                   -- Default City taken --
INSERT INTO Default_table VALUES (3,'Satya',35);                                   -- ERROR coulmn do not match --
SELECT * FROM Default_table;

-- ===================================================================================================
CREATE TABLE check_table_2
(
ID INT UNIQUE NOT NULL,
CName VARCHAR(100) UNIQUE,
Age INT CHECK (Age >= 22 AND Age <=40),
City VARCHAR(100) CHECK (City IN ('Chennai','Hyderabad','Bangalore'))
);
INSERT INTO check_table_2 VALUES (1,'Satya',35, 'Chennai');           
INSERT INTO check_table_2 VALUES (1,'Sita',32, 'Pune');                    -- UNIQUE ID and City ERROR --
SELECT * FROM check_table_2;
-- ======================================================================================================