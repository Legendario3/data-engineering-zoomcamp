select count(*) from ny_taxi.public.yellow_taxi_trips t
where lpep_dropoff_datetime >= '2019-10-1' and lpep_dropoff_datetime < '2019-11-1'
  and t.trip_distance <=1;

select count(*) from ny_taxi.public.yellow_taxi_trips t
where lpep_dropoff_datetime >= '2019-10-1' and lpep_dropoff_datetime < '2019-11-1'
  and t.trip_distance >1 and t.trip_distance <=3;

select count(*) from ny_taxi.public.yellow_taxi_trips t
where lpep_dropoff_datetime >= '2019-10-1' and lpep_dropoff_datetime < '2019-11-1'
  and t.trip_distance >3 and t.trip_distance <=7;

select count(*) from ny_taxi.public.yellow_taxi_trips t
where lpep_dropoff_datetime >= '2019-10-1' and lpep_dropoff_datetime < '2019-11-1'
  and t.trip_distance >7 and t.trip_distance <=10;


select count(*) from ny_taxi.public.yellow_taxi_trips t
where lpep_dropoff_datetime >= '2019-10-1' and lpep_dropoff_datetime < '2019-11-1'
  and t.trip_distance >10;

SELECT DATE(t.lpep_pickup_datetime), max(t.trip_distance) FROM ny_taxi.public.yellow_taxi_trips t
group by
    DATE(t.lpep_pickup_datetime)

order by 2 desc
limit 1;

SELECT z."Zone", sum(t.total_amount) as total FROM ny_taxi.public.yellow_taxi_trips t
                                             inner join zones z on z."LocationID"=t."PULocationID"
where
    DATE(t.lpep_pickup_datetime) = '2019-10-18'

group by
    z."Zone"
having sum(t.total_amount)  > 13000
order by 2 desc

;
SELECT zdrop."Zone" as "Drop Zone"
     ,zpickup."Zone" as "Pickup Zone"
     ,extract(year from t.lpep_pickup_datetime) as "Year"
     ,extract(month from t.lpep_pickup_datetime) as "month"
     , max(t.tip_amount) as max_tip
FROM ny_taxi.public.yellow_taxi_trips t
    inner join zones zpickup on zpickup."LocationID"=t."PULocationID"
    inner join zones zdrop on zdrop."LocationID"=t."DOLocationID"
 where
    extract(year from t.lpep_pickup_datetime) = 2019
    and extract(month from t.lpep_pickup_datetime) = 10
    and zpickup."Zone" = 'East Harlem North'

group by
    zdrop."Zone"
       ,zpickup."Zone"
    ,extract(year from t.lpep_pickup_datetime)
    ,extract(month from t.lpep_pickup_datetime)
order by max_tip desc

;


