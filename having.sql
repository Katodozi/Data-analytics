-- Having vs where

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

-- The HAVING clause in SQL is used to filter groups or aggregated results after a 
-- GROUP BY operation, whereas the WHERE clause filters records before any grouping or 
-- aggregation is performed
-- you can use where clause here but on;y before group by...