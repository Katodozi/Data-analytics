-- String functions

-- Length function: they can be used in a case like filtering the valid phone numbers(length=10)
SELECT first_name, length(first_name)
FROM employee_demographics
order by 2;

-- Upper
SELECT first_name, upper(first_name), lower(first_name) -- chaange into upper case
FROM employee_demographics
order by 2;

-- trim
SELECT TRIM('            sky            ');
SELECT LTRIM('            sky            ');
SELECT RTRIM('            sky            ');

-- Left and right
select first_name, left(first_name, 4), right(first_name, 4)
from employee_demographics;

-- substring
select first_name, substring(first_name, 3,2) -- start from third char and return 2 char after
from employee_demographics;

select birth_date, substring(birth_date, 6, 2) as birth_month
from employee_demographics;

-- replace
select first_name, replace(first_name, 'a','z') -- replace a with z 
from employee_demographics;

-- locate

select locate('z', 'Anuz');

select first_name, locate('an', first_name)
from employee_demographics;

-- concatination

select first_name, last_name,
concat(first_name,' ', last_name) as full_name
from employee_demographics;