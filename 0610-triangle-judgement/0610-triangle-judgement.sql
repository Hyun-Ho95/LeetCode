# Write your MySQL query statement below
SELECT *
    , (CASE
         WHEN GREATEST(abs(x),abs(y),abs(z)) = abs(z) AND abs(x)+abs(y) > abs(z) THEN 'Yes'
         WHEN GREATEST(abs(x),abs(y),abs(z)) = abs(y) AND abs(x)+abs(z) > abs(y) THEN 'Yes'
         WHEN GREATEST(abs(x),abs(y),abs(z)) = abs(x) AND abs(y)+abs(z) > abs(x) THEN 'Yes'
         ELSE 'No'
       END) AS triangle
FROM Triangle
