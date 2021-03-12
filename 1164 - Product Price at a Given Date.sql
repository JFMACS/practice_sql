select
    p.product_id, ifnull(new_price, 10) price
from
    (select distinct product_id
    from Products) p left join
    (select *
    from Products
    where (product_id, change_date) in 
        (select product_id, MAX(change_date) change_date
    from Products
    where change_date <= '2019-08-16'
    group by product_id)
) c on p.product_id = c.product_id