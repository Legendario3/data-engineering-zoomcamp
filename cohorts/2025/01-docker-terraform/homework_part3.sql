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

select * from ny_taxi.public.yellow_taxi_trips t limit 100

