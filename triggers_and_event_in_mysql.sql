-- Triggers and events
-- scenario is that whenever we make changes in employee_salary table then it should make changes in employee_demographics too


-- creating trigger 
 DELIMITER $$
 CREATE TRIGGER employee_trigger -- creating trigger
	AFTER INSERT ON employee_salary -- when this event occur
    FOR EACH ROW 
BEGIN -- this change will occur
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); -- new values will be updated , and for old values you can use old
END $$
DELIMITER ;

insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values(13, 'john', 'abraham', 'md', 39303, 4);

select *
from employee_salary;

select * 
from employee_demographics;

-- Events (it triggers new events )

select * 
from employee_demographics;

delimiter $$
create event delete_retirees1
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age>=40;
end $$
delimiter ;

show variables like 'event%';