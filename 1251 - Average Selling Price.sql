select
    p.product_id, ROUND(SUM(price * units) / SUM(units), 2) average_price
from
    Prices p, UnitsSold u
where
p.product_id = u.product_id and purchase_date >= start_date and purchase_date <= end_date
group by
p.product_id