WITH hourly AS (
  SELECT
    trip_date,
    hour,
    CASE WHEN day_num IN (1, 7) THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    SUM(riders) AS total_riders
  FROM bart.trips_clean
  GROUP BY trip_date, hour, day_type
),

day_counts AS (
  SELECT
    CASE WHEN day_num IN (1, 7) THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    COUNT(DISTINCT trip_date) AS n_days
  FROM bart.trips_clean
  GROUP BY day_type
)

SELECT
  h.day_type,
  h.hour,
  ROUND(SUM(h.total_riders) / MAX(d.n_days)) AS avg_riders
FROM hourly h
JOIN day_counts d
  ON h.day_type = d.day_type
GROUP BY h.day_type, h.hour
ORDER BY h.day_type, h.hour;

