select
    seller_id
from
(
    select
        seller_id, SUM(price) sum_price
    from Sales
    group by seller_id
) s
where 
sum_price = 
(
    select
    SUM(price)
    from Sales
    group by seller_id
    order by SUM(price) desc limit 1
)