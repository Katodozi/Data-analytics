SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT first_name, age,
age + 10
FROM parks_and_recreation.employee_demographics;
# PEMDAS is the sequence in which the arithmetic operations are performed in sql
# it stands for parenthesis, exponent, mul, div, add, sub

SELECT first_name, age,
(age + 10) * 2 - 20
FROM parks_and_recreation.employee_demographics;

#distinct selects only the unique value in the column
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name,gender
FROM parks_and_recreation.employee_demographics;