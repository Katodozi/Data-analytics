-- Temporary tables(there are two ways)
-- if we want to test something out then we can do it using temporary tables first
-- if we create some table and we close the sql now and when we return then it's not gonna be there

create temporary table temp_table1
(
frist_name varchar(20),
last_name varchar(20),
favourite_movie varchar(50)
);

select *
from temp_table1;

insert into temp_table1
values('Lexa','Abraham','Lord of the rings');

select *
from temp_table1;

-- another way
select * 
from employee_salary;

create temporary table salary_over_50k
select *
from employee_salary
where salary >= 50000;

select *
from salary_over_50k;

-- remember that the temporary table still works on other windows or new file you create as
-- long as you are in the same session, but when you exit and come then it won't work
-- which means the code or query is there but you have to run it all again to create them