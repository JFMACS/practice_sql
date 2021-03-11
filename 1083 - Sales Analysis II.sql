select
    distinct buyer_id
from
    Sales s, Product p
where
s.product_id = p.product_id and product_name = 'S8'
    and buyer_id not in
(
    select buyer_id
    from Sales s, Product p
    where s.product_id = p.product_id and product_name = 'iPhone'
)