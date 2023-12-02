# Write your MySQL query statement below
WITH single_num AS
(SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1)

SELECT CASE WHEN MAX(num) IS NOT NULL THEN MAX(num) ELSE NULL END AS num
FROM single_num

