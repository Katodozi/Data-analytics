-- Unions(unique values in the column we select)

SELECT first_name, last_name
FROM employee_demographics
UNION  -- by default (union distinct)
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name
FROM employee_demographics
UNION ALL -- it lets the duplicate value repeat
SELECT first_name, last_name
FROM employee_salary;

-- Now company wants to fire the old employees and highly paid employees

SELECT first_name, last_name, 'old man' AS Label
FROM employee_demographics
WHERE age>40 AND gender='male'
UNION
SELECT first_name, last_name, 'highly paid employee' AS Label
FROM employee_salary
WHERE salary>50000
UNION
SELECT first_name, last_name, 'old lady' AS Label
FROM employee_demographics
WHERE age>40 AND  gender = 'female'
ORDER BY first_name
;