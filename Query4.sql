-- Identify the most common pizza size ordered. 

SELECT 
    pizzas.size,
    COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size -- if we have aggregated value we have to use group by on the basis of non aggregated column
ORDER BY order_count DESC;