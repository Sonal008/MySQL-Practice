-- ==========================================================================================  -- 
                                            -- ON DELETE CASCADE --
USE Practice;

CREATE TABLE Customers
(
ID INT PRIMARY KEY,
CName VARCHAR(50) NOT NULL,
City VARCHAR(50) DEFAULT 'Mumbai'
);

SELECT * FROM Customers;
									 
-- To avoid deleting from child tables --
CREATE TABLE del_casc
(
Order_ID INT PRIMARY KEY,
Product VARCHAR(50) NOT NULL,
AMOUNT INT,
ID INT,
CONSTRAINT fk_key FOREIGN KEY (ID) REFERENCES Customers (ID) ON DELETE CASCADE     -- we can delete record from parent table directly
);

INSERT INTO del_casc VALUES (2,'Refrigerator', 50000, 102);                    
SELECT * FROM del_casc;

DELETE FROM Customers WHERE ID = 102;                            
SELECT * FROM Customers;
-- On DELETE Cascade helps to delete record direct from Parent table --

-- ------------------------------------------------------------------------------------------------------------- --
									    -- ON UPDATE CASCADE --
-- To avoid deleting from child tables --
CREATE TABLE up_casc
(
Order_ID INT PRIMARY KEY,
Product VARCHAR(50) NOT NULL,
AMOUNT INT,
ID INT,
CONSTRAINT f_key FOREIGN KEY (ID) REFERENCES Customers (ID) ON UPDATE CASCADE     -- we can update record from parent table directly
);

INSERT INTO up_casc VALUES (3,'Mobile', 25000, 101);                    
SELECT * FROM up_casc;

UPDATE Customers SET CName = 'Renu' WHERE ID = 101;
                          
SELECT * FROM Customers;
-- On UPDATE Cascade helps to Update record direct in Parent table --
-- ============================================================================================================== --
                                                 -- Auto Increment --
CREATE TABLE Students
(
ID INT UNIQUE AUTO_INCREMENT,
SName VARCHAR (100),
City VARCHAR (100)
);

INSERT INTO Students (SName, City) VALUES ('Sonal', 'Mumbai');      -- specify columns --
INSERT INTO Students VALUES ('Sakshi', 'Mumbai');                   -- ERROR - COlumn unmatched
INSERT INTO Students (SName, City) VALUES ('Sakshi', 'Mumbai');    
INSERT INTO Students (SName, City) VALUES ('Revati', 'Pune'); 
INSERT INTO Students VALUES (100, 'Bharti', 'Mumbai');              -- Taking ID as 100 --
INSERT INTO Students (SName, City) VALUES ('Chadrakant', 'Satara'); -- Takes ID in sequence to last entered ID only 
SELECT * FROM Students;

-- ================================================================================================================= --
                                               -- ALTER STATEMENT --
CREATE TABLE population
(
ID INT UNIQUE AUTO_INCREMENT,
PName VARCHAR (100),
State VARCHAR (100),
Gender CHAR(1)
);
SELECT * FROM population;
DESC population;                                                          -- Describe the Table --

INSERT INTO population (PName, State,  Gender) Values('Johnson', 'California', 'M'),
													 ('Pattrick', 'New York','M'),
													 ('Naysa', 'Ohio','F'),
												     ('Christin', 'Atlanta', 'F');

-- ADD A NEW COLUMN --
ALTER TABLE population                                                    -- Alter data in table/ No semincolon at last --
ADD COLUMN Country VARCHAR(50);                                           -- Adding column to table & define data type --


SELECT * FROM population;

INSERT INTO population (PName, State,  Gender, Country) Values('Simon', 'Chicago', 'M','USA'); -- Add Country column												     

SET SQL_SAFE_UPDATES = 0;                                                 -- UPDATE MODE ENABLE --
UPDATE population SET Country = 'USA' WHERE Country = '';                 -- EMPTY ROWS DOESN'T EXIST, ITS NULL rows --
UPDATE population SET Country = 'USA' WHERE Country IS NULL;
SELECT * FROM population;

-- REMOVE THE COLUMN --
ALTER TABLE population
DROP COLUMN Country;        
SELECT * FROM population;

-- MODIFYING THE COLUMN --
DESC population;
ALTER TABLE population
MODIFY State VARCHAR(50) DEFAULT 'Alaska';

ALTER TABLE population                                                 -- FOR EVERY CHANGE YOU HAVE TO TYPE ALTER STATEMENT --
MODIFY Gender CHAR(1) NOT NULL;
DESC population;

-- RENAMING THE COLUMN -- 
ALTER TABLE population
RENAME COLUMN State TO Place;                                     
SELECT * FROM population;

-- RENAMING THE TABLE --
SELECT * FROM population;
RENAME Table population TO Natives; 
SELECT * FROM Natives;
-- ========================================================================================= --