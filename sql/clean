CREATE TABLE bart.trips_clean AS
SELECT
  trip_date,
  hour,
  origin,
  dest,
  riders,
  FORMAT_DATE('%A', trip_date)         AS day_name, 
  EXTRACT(DAYOFWEEK FROM trip_date)    AS day_num
FROM bart.hourly_od_2025
WHERE origin != dest;
