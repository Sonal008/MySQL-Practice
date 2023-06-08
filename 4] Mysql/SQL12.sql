-- ==============================
-- DATE FUNCTION

SELECT CURRENT_DATE();

SELECT CURRENT_TIMESTAMP();

SELECT CURRENT_TIME();

SELECT NOW();

-- DATE FUNCTIONS --

-- %a -Abbreviated weekday name (Sun-Sat)
-- %W - weekday fullname (Sunday...Saturday)
-- %b -Abbreviated month name (Jan-Dec)
-- %M -Month name (January-December)
-- %c -Month, numeric (0-12)
-- %d -Day of month, numeric (00-31)
-- %D -Day of month with English suffix (0th, 1st, 2nd, 3rd)
-- %y -Year, numeric, two digits
-- %Y -Year, numeric, four digits
-- %H -Hour (00-23)
-- %h -Hour (01-12)
-- %I -Hour (01-12)
-- %p -AM or PM
-- %i -Minutes, numeric (00-59)
-- %j -Day of year (001-366)
-- %m -Month, numeric (00-12)
-- %r -Time, 12-hour (hh:mm:ss followed by AM or PM)
-- %S -Seconds (00-59)
-- %T -Time, 24-hour (hh:mm:ss)
-- %w -Day of the week (0=Sunday, 6=Saturday)


SELECT current_timestamp();
-- 18th April Tuesday 2023 08:58 PM

SELECT DATE_FORMAT(current_timestamp(),"%D %M %W %Y %l:%i %p");

SELECT current_date();
SELECT DATE_FORMAT(current_date(), "%d-%c-%Y");

-- =========================================================
-- TCL - TRANSACTION CONTROL LANGUAGE
-- COMMIT ROLLBACK SAVEPOINT

SET SQL_SAFE_UPDATES=0;

START TRANSACTION;
SELECT * FROM trans_table;

UPDATE trans_table SET amt=210000 WHERE trans_id=3;
UPDATE trans_table SET amt=20000 WHERE trans_id=4;

UPDATE trans_table SET amt=230000 WHERE trans_id=2;

UPDATE trans_table SET amt=80000 WHERE trans_id=1;
SELECT * FROM trans_table;
COMMIT;
SELECT * FROM trans_table;

START TRANSACTION;
SELECT * FROM trans_table;
UPDATE trans_table SET amt=60000;
SELECT * FROM trans_table;
ROLLBACK;

SELECT * FROM trans_table;

START TRANSACTION;

SAVEPOINT sp1;
	INSERT INTO trans_table values(112,9,'Car',1500000);
    SELECT * FROM trans_table;

SAVEPOINT sp2;
	INSERT INTO trans_table values(113,10,'Lunch',200);
    SELECT * FROM trans_table;
    
ROLLBACK TO sp2;


START TRANSACTION;

SELECT * FROM trans_table;

DELETE FROM trans_table;

SELECT * FROM trans_table;

ROLLBACK;

START TRANSACTION;

SELECT * FROM customer;

truncate customer;

SELECT * FROM customer;

ROLLBACK;

START TRANSACTION;

SELECT * FROM default_table;

DELETE FROM default_table;

SELECT * FROM default_table;

ROLLBACK;


-- DATA CONTROL LANGUGE (DCL)

SELECT current_user();

-- PRIVILEGES:
-- SELECT
-- INSERT
-- UPDATE
-- DELETE
-- DROP
-- ALTER
-- INDEX
-- CREATE
-- GRANT
-- ALL

GRANT SELECT ON emp_table TO root@localhost;

GRANT SELECT,INSERT,UPDATE ON emp_table TO root@localhost;

REVOKE INSERT,UPDATE ON emp_table FROM root@localhost;