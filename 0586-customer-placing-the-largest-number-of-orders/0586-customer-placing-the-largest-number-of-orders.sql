# Write your MySQL query statement below
SELECT customer_number
FROM (SELECT customer_number
     , COUNT(order_number) cnts 
FROM Orders
GROUP BY customer_number
ORDER BY cnts DESC
LIMIT 1) total