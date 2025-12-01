-- Joins are divided into inner joins, outer joins and self joins.

SELECT * 
FROM employee_demographics
JOIN employee_salary -- by default when we only write join, it is inner joins
ON employee_demographics.employee_id = employee_salary.employee_id;

-- Joins in SQL are used to combine rows from two or more tables based on a related column between them.

SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id;

-- outer joins 
-- left outer join and right join (left join or right join)

SELECT * 
FROM employee_demographics
LEFT JOIN employee_salary -- everything from left table and only a matching rows from right table
ON employee_demographics.employee_id = employee_salary.employee_id;-- i.e null values for non matching rows
-- Useful when all left table data is required regardless of matches.

SELECT * 
FROM employee_demographics
RIGHT JOIN employee_salary -- everything from right table and only a matching rows from left table
ON employee_demographics.employee_id = employee_salary.employee_id;

-- self join: a table joined to itself
SELECT *
FROM employee_salary emp1-- by default there is as between employee_salary and emp1
JOIN employee_salary emp2-- Useful for hierarchical data (e.g., employee-manager relationships).
ON emp1.employee_id + 1 = emp2.employee_id;

SELECT emp1.employee_id as employee_no_junior,
emp1.first_name as junior_first_name,
emp1.last_name as junior_last_name,
emp2.employee_id as employee_no_senior,
emp2.first_name as senior_first_name,
emp2.last_name as sernior_last_name
FROM employee_salary emp1
JOIN employee_salary emp2
ON emp1.employee_id + 1 = emp2.employee_id;

-- joining multiple tables

SELECT *-- joining the table 1 and 3 even though they don't have any similar columns through table 2
FROM employee_demographics AS dem
JOIN employee_salary AS sal
ON dem.employee_id = sal.employee_id
JOIN parks_departments dep
ON sal.dept_id = dep.department_id;