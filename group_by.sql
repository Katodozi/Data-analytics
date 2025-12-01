-- Group By clause

SELECT * 
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender;

-- GROUP BY in SQL is used to group rows and apply aggregate functions, 
-- while DISTINCT is used to remove duplicate rows from the result set, returning only unique values without aggregation
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

SELECT occupation, MAX(salary), COUNT(salary)
FROM employee_salary
GROUP BY occupation;