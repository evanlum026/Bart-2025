WITH daily_exits AS (
  SELECT trip_date, dest, day_name, day_num, SUM(riders) AS exits
  FROM bart.trips_clean
  GROUP BY trip_date, dest, day_name, day_num
),

baseline AS ( 
  SELECT 
    trip_date, 
    dest, 
    day_name,
    day_num,
    exits,
    AVG(exits) OVER (PARTITION BY dest, day_name) AS avg_exits,
    STDDEV (exits) OVER (PARTITION BY dest, day_name) AS sd_exits
  FROM daily_exits
),

scored AS (
  SELECT 
  *,
  exits - avg_exits AS diff_riders,
  (exits - avg_exits) / sd_exits AS z_score
  FROM baseline
)

SELECT 
  trip_date,
  dest, 
  day_name,
  exits,
  round(avg_exits) AS avg_exits,
  round(z_score,2) AS z_score
FROM scored
WHERE z_score > 3
ORDER BY ABS(z_score) DESC
LIMIT 10




