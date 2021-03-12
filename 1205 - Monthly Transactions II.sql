-- 先获取所有月份与国家的组合 再先后 left join 已批准的订单和已退单的订单 最后除去多余的组合
select
month, country,
ifnull(approved_count, 0) approved_count,
ifnull(approved_amount, 0) approved_amount,
ifnull(chargeback_count, 0) chargeback_count,
ifnull(chargeback_amount, 0) chargeback_amount
from
(
    select distinct month, country
from
    (            select left(trans_date, 7) month
        from Transactions
    union
        select left(trans_date, 7) month
        from Chargebacks) m, (select distinct country
    from Transactions) c
) m
left join
(
    select
    left(trans_date, 7) month, country, count(id) approved_count, sum(amount) approved_amount
from
    Transactions
where state = 'approved'
group by month, country
) a 
using(month, country)
left join
(select left(c.trans_date, 7) month, country, count(trans_id) chargeback_count, sum(amount) chargeback_amount
from Chargebacks c left join Transactions t on c.trans_id = t.id
group by month, country) c 
using(month, country)
where
chargeback_count is not null
or approved_count is not null
