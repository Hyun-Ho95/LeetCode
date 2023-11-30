With Temp AS
(SELECT *
FROM Activity)

SELECT ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM TEMP), 2) AS fraction
FROM Activity
WHERE (player_id,event_date) IN (SELECT player_id
                                      , DATE_ADD(MIN(event_date), INTERVAL 1 DAY) AS next_first_login
                                 FROM Activity 
                                 GROUP BY player_id)
                                 
                                 
