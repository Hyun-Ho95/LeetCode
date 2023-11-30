# Write your MySQL query statement below
SELECT teacher_id
     , COUNT(subject_id) AS cnt
FROM (SELECT teacher_id,subject_id,COUNT(*)
FROM Teacher
GROUP BY teacher_id,subject_id) AS teacher_grouping
GROUP BY teacher_id