-- stored procedure
-- A stored procedure in SQL is a precompiled collection of one or more SQL statements that are stored inside the database. 
-- It can be executed repeatedly as a single unit

select * 
from employee_salary
where salary>=50000;

create procedure large_salary() -- not much preferred way
select * 
from employee_salary
where salary>=50000;

call large_salary();

-- delimiter change 


-- for this query we are changing ; to $$ so that ; doesn't depict the end anymore
DELIMITER $$

CREATE PROCEDURE large_salaries2()
BEGIN
   SELECT * FROM employee_salary WHERE salary >= 50000;
   SELECT * FROM employee_salary WHERE salary >= 10000;
END $$

DELIMITER ;

CALL large_salaries2();

-- perimeters in stored procedure

DELIMITER $$

CREATE PROCEDURE large_salaries3(id INT)
BEGIN
	SELECT salary
    FROM employee_salary
    WHERE employee_id = id -- at the end the 1 is assigned to employee_id
    ;
END $$

DELIMITER ;

CALL large_salaries3(1);
