# Write your MySQL query statement below

with temp as
(select *
from Activity)
    select round(count(distinct player_id) / (select count(distinct player_id) from temp), 2) as fraction
    from Activity
    where (player_id, event_date) IN (select player_id, DATE_ADD(min(event_date), INTERVAL 1 DAY) as nextday_first_log from Activity group by player_id)

