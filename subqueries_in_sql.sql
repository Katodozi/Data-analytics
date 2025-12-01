-- subqueries: query within another query (we use parenthesis for the sub queries)

select * 
from employee_demographics 
where employee_id in -- we can use in operator instead of join in some cases
	(select employee_id -- we can only select one column in the subquery
    from employee_salary
    where dept_id=1)
;

-- scanerio is that you have to compare every salary to know if it is above average or below average
select first_name, last_name,
(
select avg(salary) 
from employee_salary
)
from employee_salary;

select avg(avg_age), avg(`max(age)`)
from 
(
select gender, avg(age) as avg_age, max(age), min(age) as min_age, count(age) as count_age
from employee_demographics 
group by gender
) as agg_table
;

select avg(avg_age), avg(`max(age)`)
from 
(
select gender, avg(age) as avg_age, max(age), min(age) as min_age, count(age) as count_age
from employee_demographics 
group by gender
) as agg_table
group by gender
;