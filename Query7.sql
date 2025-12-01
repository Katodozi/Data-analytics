-- determine the distribution of orders by hour of the day

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS pizza_quantity
FROM
    orders
GROUP BY hour
ORDER BY hour;