WITH hourly AS (
  SELECT 
    trip_date, 
    day_name, 
    day_num, 
    hour, 
    SUM(riders) AS total_riders
  FROM bart.trips_clean
  GROUP BY trip_date, hour, day_num, day_name
),

day_counts AS (
  SELECT 
    day_name,
    COUNT(DISTINCT trip_date) AS n_days
  FROM bart.trips_clean
  GROUP BY day_name
)

SELECT 
  d.day_name,
  h.hour,
  ROUND(SUM(h.total_riders)/MAX(d.n_days)) AS avg_riders
FROM day_counts d
JOIN hourly h
ON d.day_name = h.day_name
GROUP BY h.day_num, d.day_name, h.hour
ORDER BY h.day_num, h.hour;
