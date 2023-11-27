# # Write your MySQL query statement below
# SELECT p.product_id
#      , IFNULL(ROUND(SUM(p.price * u.units) / SUM(u.units), 2),0) AS average_price
# FROM Prices p
# LEFT JOIN UnitsSold u ON p.product_id = u.product_id 
# WHERE u.purchase_date BETWEEN p.start_date AND p.end_date
# GROUP BY p.product_id

select p.product_id
    , ifnull(round(sum(p.price * u.units) / sum(units), 2), 0) as average_price
from Prices p
left join UnitsSold u 
on p.product_id = u.product_id
and (u.purchase_date between p.start_date and p.end_date)
group by p.product_id