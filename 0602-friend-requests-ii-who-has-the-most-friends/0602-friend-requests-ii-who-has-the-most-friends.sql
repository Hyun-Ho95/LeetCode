# Write your MySQL query statement below
WITH cte_re AS(
SELECT requester_id AS id
     , COUNT(accepter_id) AS cnt
FROM RequestAccepted
GROUP BY requester_id)
,
cte_ac AS(
SELECT accepter_id AS id
     , COUNT(accepter_id) AS cnt
FROM RequestAccepted
GROUP BY accepter_id)
,
cte_union AS (
SELECT * FROM cte_re
UNION ALL
SELECT * FROM cte_ac)

SELECT id
     , SUM(cnt) AS num
FROM cte_union
GROUP BY id
ORDER BY num DESC
LIMIT 1