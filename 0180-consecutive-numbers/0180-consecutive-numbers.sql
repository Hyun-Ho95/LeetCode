# Write your MySQL query statement below

SELECT DISTINCT num AS ConsecutiveNums
FROM (SELECT id,
             num,
             LAG(num) OVER (ORDER BY id) AS prev_num,
             LEAD(num) OVER (ORDER BY id) AS next_num
      FROM Logs) consecutive
WHERE num = prev_num 
  AND num = next_num