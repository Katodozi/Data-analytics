-- Determine the top three most ordered pizza types based on their revenue

SELECT 
    SUM(pizzas.price * order_details.quantity) AS revenue,
    pizza_types.name
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
        JOIN
    pizza_types ON pizza_types.pizza_type_id = pizzas.pizza_type_id
GROUP BY pizza_types.name
ORDER BY revenue DESC
LIMIT 3; 