-- =================================================================================================================== --
                                                     -- DELETE STATEMENT --
-- DELETE statement can be used to delete one/many/all rows
-- Rollback is possible in DELETE

CREATE TABLE Car
(
ID INT UNIQUE AUTO_INCREMENT,
Model VARCHAR (100),
SP INT,
Fuel VARCHAR (100)
);

INSERT INTO Car (Model, SP, Fuel) VALUES ('Maruti Alto', 600000, 'Petrol');
INSERT INTO Car (Model, SP, Fuel) VALUES ('Mercedes-Benz', NULL, 'Petrol'),
                                         ('Chevrolet Sail',860000,'Diesal'),
										 ('Skoda Superb Ambition', NULL , NULL),
                                         ('Tata Indica', 260000, 'Diesal'),
                                         ('Audi Q7', 365000, NULL), 
                                         ('Honda City', 135000, 'Petrol'),
                                         ('Jeep Compass', 1900000, 'Diesal');
DESC Car;                                                   -- Describe Table --
DELETE FROM Car WHERE Fuel IS NULL;
DELETE FROM Car WHERE SP< 50000;                             
DELETE FROM Car;                                            -- Delete entire table --
SELECT * FROM Car;
-- ----------------------------------------------------------------------------------------------------- --
                                --  TCL -  TRANSACTION CONTROL LANGUAGE IN --
												-- DELETE --
START TRANSACTION;
SELECT * FROM Car;
DELETE FROM Car;                       
SELECT * FROM Car;
ROLLBACK;                                                                              -- DELETE does Rollback data --
COMMIT;
SELECT * FROM Car;
-- ================================================================================================================= --
                                              -- TRUNCATE STATEMENT --
-- TRUNCATE is delete all the records in a table
SELECT * FROM Car;
TRUNCATE TABLE CAR;
SELECT * FROM Car;
									--  TCL -  TRANSACTION CONTROL LANGUAGE IN --
												     -- TRUNCATE --
START TRANSACTION;
SELECT * FROM Car;
TRUNCATE TABLE Car;  
SELECT * FROM Car;
ROLLBACK;                                                                            -- Doesn't rollback in Truncate --
COMMIT;
SELECT * FROM Car;
-- ================================================================================================================= --
												     -- DROP STATEMENT --
-- Drop will delete the entire data as well as the table also
SELECT * FROM Car;
DROP TABLE Car;
SELECT * FROM Car;
                                       --  TCL -  TRANSACTION CONTROL LANGUAGE IN --
													     -- DROP --
START TRANSACTION;
SELECT * FROM Car;
DROP TABLE Car;  
SELECT * FROM Car;
ROLLBACK;
COMMIT;
SELECT * FROM Car;
-- ================================================================================================================= --