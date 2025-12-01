-- Calculate the percentage contribution of each pizza type to the total revenue(by category)

SELECT 
    pizza_types.category,
    round(((SUM(pizzas.price * order_details.quantity) / (SELECT 
            SUM(pizzas.price * order_details.quantity)
        FROM
            pizzas
                JOIN
            order_details ON pizzas.pizza_id = order_details.pizza_id)) * 100)) AS revenue_in_percentage
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category;

-- (select sum(pizzas.price * order_details.quantity) as total_revenue
-- from pizzas join order_details 
-- on pizzas.pizza_id = order_details.pizza_id);