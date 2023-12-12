# Write your MySQL query statement below
SELECT MIN(result) AS results
FROM (
    SELECT u.name AS result
    FROM MovieRating r
    INNER JOIN Users u ON r.user_id = u.user_id
    GROUP BY u.name
    ORDER BY COUNT(*) DESC, u.name
    LIMIT 1) AS names

UNION ALL

SELECT MIN(result) AS results
FROM (
    SELECT m.title AS result
    FROM MovieRating r
    INNER JOIN Movies m ON r.movie_id = m.movie_id 
    WHERE LEFT(created_at,7) = '2020-02'
    GROUP BY m.title
    ORDER BY AVG(r.rating) DESC, m.title
    LIMIT 1) AS movies
