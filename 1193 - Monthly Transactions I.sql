
select
    month, t.country, count(t.id) trans_count, count(a.id) approved_count, sum(t.amount) trans_total_amount, ifnull(sum(a.amount), 0) approved_total_amount
from
    (select *, left(trans_date, 7) month
    from Transactions) t left join
    (select *
    from Transactions
    where state = 'approved') a 
using(id)
group by month, country