-- CTE = common table expressions
-- A CTE (Common Table Expression) in MySQL is a named temporary 
-- result set that exists only for the duration of a single SQL query.
-- we can only use cte immediately after it's created

with cte_example as -- with, as and parenthesis are used to define cte
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_example
;

-- we can do the same using subquery too but it's little difficult in reading and understanding

select avg(avg_sal) from
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
) example_subquery
;

-- it is temporary table which can only be used immediately after creating after cte

-- also we can create multiple cte in a single query

with cte_example as
(
select employee_id, first_name, last_name, birth_date
from employee_demographics
where birth_date > '1982-11-11'
),
cte_example2 as
(
select employee_id, salary
from employee_salary
where salary>50000
)
select * 
from cte_example
join cte_example2
	on cte_example.employee_id = cte_example2.employee_id
;

-- we can override the alias too
with cte_example (Gender, Avg_sal, Max_sal, Min_sal, Count_sal) as -- with, as and parenthesis are used to define cte
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select *
from cte_example
;