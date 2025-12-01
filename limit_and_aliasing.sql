-- limit and aliasing 
 SELECT * 
 FROM employee_demographics
 LIMIT 3;
 
  SELECT * 
 FROM employee_demographics
 ORDER BY age DESC
 LIMIT 3;-- first arranging in descending order then applying the limit
 
  SELECT * 
 FROM employee_demographics
 LIMIT 3, 1;-- it select the one which comes after the limit of 3 i.e forth in order
 
 -- aliasing
 
 SELECT gender, AVG(age) as avg_age
 FROM employee_demographics
 GROUP BY gender
 HAVING avg_age>40;-- aliasing is used to rename the column after aggregation