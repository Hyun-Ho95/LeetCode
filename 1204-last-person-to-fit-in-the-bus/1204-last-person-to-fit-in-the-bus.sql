# Write your MySQL query statement below
SELECT person_name
FROM Queue
WHERE turn = (SELECT MAX(turn) AS turn
FROM (SELECT q1.turn
     , SUM(q2.weight) AS total_weight
FROM Queue q1 
INNER JOIN Queue q2 ON q1.turn >= q2.turn 
GROUP BY q1.turn 
HAVING total_weight <= 1000
ORDER BY q1.turn) under_1000)