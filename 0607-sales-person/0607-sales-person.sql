# Write your MySQL query statement below
SELECT name
FROM SalesPerson
WHERE sales_id NOT IN (SELECT DISTINCT o.sales_id
                       FROM Orders o
                       INNER JOIN Company c ON o.com_id = c.com_id AND c.name = 'RED')
