WITH daily AS (
  SELECT 
    trip_date, 
    day_name, 
    day_num, 
    SUM(riders) AS total_riders
  FROM bart.trips_clean
  GROUP BY trip_date, day_name, day_num
)

SELECT
  day_name,
  ROUND(AVG(total_riders)) AS avg_daily_riders,
  COUNT(*)                 AS n_days
FROM daily
GROUP BY day_num, day_name
ORDER BY day_num;
