select
    p.product_id, product_name
from
    Product p,
    (select product_id, MAX(sale_date) latest, MIN(sale_date) earliest
    from Sales
    group by product_id) t
where
p.product_id = t.product_id
    and latest <= '2019-03-31' and earliest >= '2019-01-01'