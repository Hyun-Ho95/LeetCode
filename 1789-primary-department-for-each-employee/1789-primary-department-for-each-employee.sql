# Write your MySQL query statement below
SELECT employee_id
     , department_id
FROM ((SELECT *
      FROM Employee
      WHERE primary_flag = 'Y')
UNION  
(SELECT *
FROM Employee
GROUP BY employee_id
HAVING COUNT(*) = 1 )) result

