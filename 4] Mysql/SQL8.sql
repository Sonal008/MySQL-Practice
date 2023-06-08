-- ==================== GROUP BY ================= --
USE training;
SELECT * FROM employees;

SELECT count(*) FROM employees WHERE Department = 'IT';

SELECT count(*) FROM employees;

SELECT Department, count(*) 
FROM employees 
GROUP BY Department;

SELECT Department, count(*) 
FROM employees 
GROUP BY Department 
ORDER BY Department DESC;

SELECT Department, count(*) 
FROM employees 
GROUP BY Department 
ORDER BY count(*);

SELECT Department, count(*) 
FROM employees
GROUP BY Department
ORDER BY count(*) DESC;

-- =========================================
SELECT Department, Status , count(*)
FROM employees
GROUP BY Department, Status; 

SELECT Department, Status, count(*)
FROM employees
GROUP BY Department, Status
ORDER BY Department, count(*) DESC;

SELECT Department, max(Salary), min(Salary)
FROM employees
GROUP BY Department
ORDER BY Department;


SELECT Department, max(Salary), min(Salary)
FROM employees
GROUP BY Department
Having min(salary)> 10000
ORDER BY min(salary) DESC;


SELECT Department, max(Salary)
FROM employees
WHERE JobRating != 5
GROUP BY Department
HAVING max(Salary) < 80000;











