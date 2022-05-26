--average fare for saturday
select avg("fare_amount") as "avg_fare", "day_name"
from
(select "fare_amount",
to_char("tpep_pickup_datetime", 'day') as "day_name"
from records) as a
where "day_name" like '%sat%'
group  by 2
order by 1;

--average fare for sunday
select avg("fare_amount") as "avg_fare", "day_name"
from
(select "fare_amount",
to_char("tpep_pickup_datetime", 'day') as "day_name"
from records) as a
where "day_name" like '%sun%'
group  by 2
order by 1;

--average num of trips on saturday
select  avg("passenger_count") as avg_trips, day_name
from
(select "passenger_count",
to_char("tpep_dropoff_datetime", 'day') as day_name
from records) as b
where day_name like '%sat%'
group by 2
order by 1;

--average num of trips on sunday
select avg("passenger_count") as avg_trips, day_name
from
(select "passenger_count",
to_char("tpep_dropoff_datetime", 'day') as day_name
from records) as b
where day_name like '%sun%'
group by 2
order by 1;

--average duration of trips on saturday
select avg(duration) as avg_duration, day_name
from
(select ("tpep_dropoff_datetime"-"tpep_pickup_datetime")
as duration,
to_char("tpep_dropoff_datetime", 'day') as day_name
from records) as c
where day_name like '%sat%'
group by 2;


--average duration of trips on sundays
select avg(duration) as avg_duration, day_name
from
(select ("tpep_dropoff_datetime"-"tpep_pickup_datetime")
as duration,
to_char("tpep_dropoff_datetime", 'day') as day_name
from records) as c
where day_name like '%sun%'
group by 2;
