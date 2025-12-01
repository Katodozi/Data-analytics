-- window functions in sql
-- A Window Function in SQL is a specialized function that performs calculations across a 
-- set of rows related to the current row, 
-- called a "window," without aggregating the rows into a single output.

-- Window functions allow analytical calculations at the row level without losing individual row details, 
-- while GROUP BY reduces the data by summarizing each group into single rows

select avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;

select gender, avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender;

-- over()
select gender, avg(salary) over() -- average of the column salary will be applied to each value of gender 
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;

select gender, avg(salary) over(partition by gender) -- avg of male and female separately but to each value in the table
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;

-- partition by
select dem.first_name, dem.last_name, gender, avg(salary) over(partition by gender)
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
-- here unlike group by even if we select other column it doesn't throw an error

-- roll over (cumulative total) using order by
select dem.first_name, dem.last_name, gender, 
sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
-- some other window functions
-- ordering by salary for each gender and giving them number using row_number()

select dem.employee_id,dem.first_name, dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num, -- there's a difference
dense_rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;