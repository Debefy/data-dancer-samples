/* Remember to change your location to US before executing this, or you will have sad Big Query 
    - You can either change your location in json environment file
    - or click on the "location button" bottom right to quickly override it 
*/
WITH bike_trips_summary AS (
  SELECT
    start_station_name,
    bike_id,
    COUNT(1) AS num_trips,
    AVG(duration_minutes) AS avg_duration
  FROM
    `bigquery-public-data.austin_bikeshare.bikeshare_trips`
  WHERE
    DATE(start_time) BETWEEN '2020-01-01' AND '2020-01-07'
  GROUP BY
    start_station_name, bike_id
),
ordered_summary AS (
  SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY start_station_name ORDER BY num_trips DESC) AS rn
  FROM
    bike_trips_summary
)

SELECT
  start_station_name,
  ARRAY_AGG(STRUCT(bike_id, num_trips, avg_duration)) AS bike_details
FROM
  ordered_summary
GROUP BY
  start_station_name
ORDER BY
  COUNT(bike_id) DESC
LIMIT
  10
