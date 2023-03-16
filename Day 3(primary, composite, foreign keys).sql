CREATE DATABASE Practice;

USE Practice;
-- ================================================================================= --
                            -- SIMPLE PRIMARY KEY --
CREATE TABLE Prime_Key
(
ID INT  PRIMARY KEY,                  -- Takes UNIQUE and NOT NULL values only                                     
EName VARCHAR(50) NOT NULL, 
Contact VARCHAR(50) UNIQUE,           -- taking character if user adds "+" symbol --
City VARCHAR(50) DEFAULT 'New Delhi'
);
INSERT INTO Prime_Key VALUES (001, 'Peter', '+91 78302-*****', 'Chennai');
INSERT INTO Prime_key VALUES ('Jack', '+91 78301-*****', 'Kolkata');                   -- ERROR - ID not mentioned, Columns unmatched -- 
INSERT INTO Prime_Key VALUES (NULL, 'Mini', '+91 98323-*****', 'Nalanda');             -- ERROR - ID cannot be Null --
INSERT INTO Prime_Key VALUES (001, 'Noel', '+91 99311-*****', 'New York');             -- ERROR - Duplicate ID --
INSERT INTO Prime_Key (ID, Contact, City) VALUES (002, '+91 99323-*****', 'New York'); -- ERROR - EName is not defined, Columns unmatched --
INSERT INTO Prime_Key VALUES (002, 'Peter', '+91 96710-*****', 'Madhrai');             -- EName accepts Duplicate values
INSERT INTO Prime_Key VALUES (003, 'Natasha', '+91 79811-*****');                      -- ERROR - City column not defined, Columns unmatched -- 
INSERT INTO Prime_Key (ID, EName, Contact) VALUES (004,'Sonal', '+91 90321-*****');    -- Bydefault City taken - Not to mention in Values -- 
INSERT INTO Prime_Key VALUES (005, 'Koya', NULL, NULL);                                -- City accepts NULL value --
INSERT INTO Prime_Key VALUES (006, 'Nick', NULL, 'Hyderabad');                         -- Contact Columns accepts NUll value --
INSERT INTO Prime_Key VALUES (007, 'Robert', NULL,'Mumbai');                           -- Contact Columns accepts multiple NUll values --
INSERT INTO Prime_Key VALUES (008, 'Harry', '+91 75321-*****' ,'Mumbai');
SELECT * FROM Prime_Key;

-- NOT NULL accepted - EName / Contact/ City
-- Duplicate values accepted - EName / City
-- Unique values - ID / Contact / 

-- =========================================================================================== --
                                      -- COMPOSITE PRIMARY KEY --
CREATE TABLE Comp_key
(
ID INT,                                                                    
EName VARCHAR(50) NOT NULL, 
Contact VARCHAR(50),           -- taking character if user adds "+" symbol --
City VARCHAR(50) DEFAULT 'New Delhi',
PRIMARY KEY (ID, EName)               -- taking two columns together to check primary key constraints
);                
INSERT INTO Comp_key VALUES(001, 'Jim','+91-29899- 91223','Pune');
INSERT INTO Comp_key VALUES(001, 'Jim','+91-29899- 91223','Pune');      -- ERROR-'Composite Primary  key columns' duplicate --
INSERT INTO Comp_key VALUES(002, 'Jim','+91-29899- 91223','Pune');      -- Duplicate individual column is accepted -- EName
INSERT INTO Comp_key VALUES(002, 'Jimmy','+91-29899- 91223','Pune');    -- Duplicate individual column is accepted -- ID
SELECT * FROM Comp_key;

-- for Composite key- columns in pair has be unique, individually they can be duplicate

-- ============================================================================================ --
								     -- FOREIGN KEY CONSTRAINTS --
-- Create Parent table - e.g. Customer
-- Create Child table - e.g. Orders
-- Create a common constraint column in both the tables: e.g ID column is Foreign key
-- We can create 'n' child tables for single parent
CREATE TABLE Customers
(
ID INT PRIMARY KEY,
CName VARCHAR(50) NOT NULL,
City VARCHAR(50) DEFAULT 'Mumbai'
);

INSERT INTO Customers VALUES(100, 'Revati', 'Kalyan'),
						   (101,'Sakshi', 'Dombivli'),
                           (102,'Sonal', 'Thane'),
                           (103,'Bharti', 'Mumbai');
SELECT * FROM Customers;
-- ----------------------------------------------------------------------------------------- --
CREATE TABLE Prod_order 
(
Order_ID INT PRIMARY KEY,
Product VARCHAR(50) NOT NULL,
AMOUNT INT,
ID INT,
CONSTRAINT fkey FOREIGN KEY (ID) REFERENCES Customers (ID) 
);

INSERT INTO Prod_order VALUES (1,'Laptop', 104000, 100);                  -- ID 100 of Parent & Child table matches
INSERT INTO Prod_order VALUES (2,'Refrigerator', 50000, 102);             -- ID 103 not present in Parent table
SELECT * FROM Prod_order;

DELETE FROM Customers WHERE ID = 102;                                     -- ERROR-ID 102 cannot be deleted from Parent table in this case
DELETE FROM Prod_order WHERE ID = 102;                                    -- ID 102 can be deleted from child table only this case

SELECT * FROM Prod_order;
SELECT * FROM Customers;

-- Deleting any record has to be done in child table first.
-- Record needs to be deleted frm all the child tables
-- Throws error if deleted record from parent table
-- ------------------------------------------------------------------------------------------------