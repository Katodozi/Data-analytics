-- Where Clause
SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie';

SELECT * 
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM employee_demographics
WHERE gender != 'Female';

SELECT * 
FROM employee_demographics
WHERE birth_date > 1980-01-01
AND gender = 'male';

SELECT * 
FROM employee_demographics
WHERE birth_date > 1980-01-01
OR NOT gender = 'male';

SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 50;

-- LIKE statement
-- % = anything and _ = specific value

SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'jer%'
;

SELECT * 
FROM employee_demographics
WHERE first_name LIKE '%a%' -- contains a anywhere on the string
;

SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a__' -- first letter a with 2 more characters
;

SELECT * 
FROM employee_demographics
WHERE first_name LIKE 'a___%' -- first letter a with 3 more characters and anything after that
;

SELECT * 
FROM employee_demographics
WHERE birth_date LIKE '1989%' -- can work for other than strings too
;