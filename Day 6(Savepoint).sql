-- ================================================================================================================= --
												     -- SAVE POINT --
START TRANSACTION;
SELECT * FROM Car;

SAVEPOINT S1;                                                                       -- 1st Savepoint --
UPDATE Car SET SP = 8800000 WHERE ID = 2;
SELECT * FROM Car;

SAVEPOINT S2;                                                                        -- 2nd Savepoint --
UPDATE Car SET Fuel ='Diesel' WHERE Fuel IS NULL;
UPDATE Car SET Fuel ='Diesel' WHERE Fuel = 'Diesal';
SELECT * FROM Car;

SAVEPOINT S3;                                                                        -- 3rd Savepoint --
DELETE FROM Car WHERE SP IS NULL;
SELECT * FROM Car;

SAVEPOINT S4;                                                                        -- 4th Savepoint --
SELECT * FROM Car;
DELETE FROM Car WHERE ID = 8;
SELECT * FROM Car;

ROLLBACK TO SAVEPOINT S4;
ROLLBACK TO SAVEPOINT S3;

COMMIT;

SELECT * FROM Car;
-- ================================================================================================================= --