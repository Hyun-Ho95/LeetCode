# Write your MySQL query statement below
SELECT CASE 
         WHEN COUNT(etc.salary) >=2 THEN MIN(etc.salary) 
         ELSE NULL
       END AS SecondHighestSalary
FROM (SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC 
LIMIT 2) etc