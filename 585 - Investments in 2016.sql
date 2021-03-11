select
    SUM(TIV_2016) TIV_2016
from
    insurance
where
TIV_2015 in
(
    select
        TIV_2015
    from
        insurance
    group by TIV_2015
    having count(1) > 1
)
    and (LAT, LON) not in
(
    select
        LAT, LON
    from
        insurance
    group by LAT, LON
    having count(1) > 1
)