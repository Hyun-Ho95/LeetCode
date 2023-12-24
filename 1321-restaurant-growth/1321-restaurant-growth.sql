# Write your MySQL query statement below
SELECT visited_on
     , amount
     , ROUND(amount/7,2) AS average_amount
FROM (SELECT DISTINCT visited_on
           , SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount
      FROM Customer) AS sum_amount
WHERE visited_on >= (SELECT MIN(visited_on) FROM Customer) + INTERVAL 6 DAY

