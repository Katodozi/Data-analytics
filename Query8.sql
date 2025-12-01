-- Join the relevent tables to find the category wise distribution of pizzas(number of pizza names in each categories)

SELECT 
    category, COUNT(name)
FROM
    pizza_types
GROUP BY category;