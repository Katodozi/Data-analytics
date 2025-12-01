-- case statements 

select first_name, last_name, age, 
case 
	when age <= 40 then 'young'
    when age between 40 and 50 then 'almost old'
    when age >= 50 then 'old'
end 
as age_label
from employee_demographics;

-- scenario
-- pay increase and bonus
-- salary < 50000 = 5% raise
-- salary > 50000 = 7% raise
-- finance department = 10% bonus

select first_name, last_name , salary,
case
	when salary < 50000 then salary + (salary*0.05) 
    when salary > 50000 then salary + (salary*0.07)
end as new_salary,
case
	when dept_id = 6 then salary * 1.10
end as bonus
from employee_salary;

select * from parks_departments;