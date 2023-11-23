# Write your MySQL query statement below
SELECT a1.machine_id
     , ROUND(AVG(a2.timestamp-a1.timestamp),3) AS processing_time
FROM Activity a1
INNER JOIN (SELECT machine_id
                 , process_id
                 , activity_type
                 , timestamp
            FROM activity
            WHERE activity_type = "end") a2 ON a1.machine_id = a2.machine_id
WHERE a1.activity_type = 'start'
GROUP BY a1.machine_id

