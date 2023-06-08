USE training;

-- VIEW: (Virtual Table)
-- READ ONLY table

SELECT * FROM employees;

CREATE VIEW emp_data AS 
-- vietual table is created, only these columns can be viewed
SELECT First, Last, Department, Status FROM employees;

CREATE VIEW emp_manufacturing AS
SELECT Department, Status, First, Last FROM employees 
WHERE Department = 'Manufacturing';

SELECT * FROM emp_manufacturing WHERE Status = 'Full Time';

SELECT Department,Status, count(*)
FROM employees
GROUP BY Department, Status;

-- ======================================
-- INDEX- done for big tables 

SHOW INDEX FROM employees;
SELECT * FROM employees;

CREATE INDEX emp_ind ON employees(EmployeeID);

SELECT * FROM employees WHERE EmployeeID = 200;
SELECT * FROM employees WHERE EmployeeID = 100;

CREATE INDEX dep_idx ON employees (Department, Status);

SELECT * FROM employees Where Department = 'Manufacturing' and Status = 'Full Time';
-- ==================================================================================
-- CASE STATEMENT: Reporting purpose in 
-- business for certain condition

-- SYNTAX:

--   CASE
-- 	WHEN <condition1> THEN <expr1>
--  WHEN <condition2> THEN <expr2>
--   .
--   .
--   .
--   ELSE <expression> <== none of condn is true 
--   END AS column_name 

SELECT * FROM employees;

SELECT DISTINCT JobRating FROM employees;

SELECT First, Last, Department, JobRating, CASE
                                   WHEN JobRating = 1 THEN 'A Grade'
                                   WHEN JobRating = 2 THEN 'B Grade'
                                   WHEN JobRating = 3 THEN 'C Grade'
                                   WHEN JobRating = 4 THEN 'D Grade'
                                   
                                   ELSE 'E Grade'
                                   END AS Grade
FROM employees;

SELECT Department, First, Last, Salary, Status, CASE 
WHEN Salary >70000 THEN 'Highly Paid'
WHEN Salary BETWEEN 40000 AND 70000 THEN 'Moderate Paid'
ELSE 'Minimal Paid'
END AS Payment
FROM employees;
                                   









  















