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

SELECT z."Zone", sum(t.total_amount) FROM ny_taxi.public.yellow_taxi_trips t
                                             inner join zones z on z."LocationID"=t."PULocationID"
where
    DATE(t.lpep_pickup_datetime) = '2019-10-18'

group by
    z."Zone"
order by 2 desc

;

