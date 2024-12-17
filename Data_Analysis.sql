-- 1. What is the total number of rides for each rider type (casual vs. member)?

SELECT member_casual as CustomerType, 
    COUNT(*) as NumberOfRides,
    CAST (COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM dbo.rides_2024_cleaned) as ratio
FROM dbo.rides_2024_cleaned
GROUP BY member_casual;

-- 2. How does the monthly ride count compare over the past year?

SELECT MONTH(started_at) as Month, 
    COUNT(*) as NumberOfRides,
    CAST (COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM dbo.rides_2024_cleaned) as ratio
FROM dbo.rides_2024_cleaned
GROUP BY MONTH(started_at)
ORDER BY NumberOfRides DESC;

-- 3. How do seasonal trends differ between casual and member users?

WITH CTE AS (
    SELECT MONTH(started_at) as Month, member_casual as CustomerType, 
        COUNT(*) as NumberOfRides
    FROM dbo.rides_2024_cleaned
    GROUP BY MONTH(started_at), member_casual
)
SELECT *
FROM CTE
ORDER BY CustomerType, NumberOfRides DESC;

-- 4. Which day of the week has the highest number of rides for each customer group?

SELECT member_casual as CustomerType, day_of_a_week, 
    COUNT(*) as NumberOfRides
FROM dbo.rides_2024_cleaned
GROUP BY day_of_a_week, member_casual
ORDER BY NumberOfRides DESC;

-- 5. What is the average ride duration for casual and member users?

SELECT member_casual as CustomerType, 
    round(avg(cast(datediff(second, started_at, ended_at) as float)/60),0) AverageDurationMinutes, 
    round(min((cast(datediff(second, started_at, ended_at) as float)/60)),0) MinDurationMinutes, 
    round(max(cast(datediff(second, started_at, ended_at) as float)/60),0) MaxDurationMinutes
FROM dbo.rides_2024_cleaned
group by member_casual;

-- 6. How does ride duration vary by day of the week for each group?

SELECT member_casual as CustomerType, day_of_a_week Date,
    round(avg(cast(datediff(second, started_at, ended_at) as float)/60),0) AverageDurationMinutes
FROM dbo.rides_2024_cleaned
GROUP BY member_casual, day_of_a_week;

-- 7. When do riders typically use the service most (by time of day)?

SELECT 
    DATEPART(hour, started_at) AS ride_hour,
    COUNT(*) AS total_rides,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count
FROM dbo.rides_2024_cleaned
GROUP BY DATEPART(hour, started_at)
ORDER BY total_rides DESC;

--  8. Which 10 locations have the highest ride volumes, and how do the groups differ?

SELECT top 10 
    start_lat, 
    start_lng, 
    start_station_name,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS casual_count,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS member_count,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) +
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS total_rides,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) - 
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS difference
FROM 
    dbo.rides_2024_cleaned
GROUP BY 
    start_lat, start_lng, start_station_name
ORDER BY total_rides DESC, difference DESC;

-- 9. How do start and end locations vary between the two rider types?

SELECT member_casual,
    COUNT(CASE WHEN start_lat = end_lat AND start_lng = end_lng THEN 1 END) AS same_location_count,
    COUNT(CASE WHEN start_lat <> end_lat OR start_lng <> end_lng THEN 1 END) AS different_location_count,
    CAST(COUNT(CASE WHEN start_lat = end_lat AND start_lng = end_lng THEN 1 END) AS FLOAT)/ COUNT(*) AS same_location_ratio
FROM dbo.rides_2024_cleaned
group by member_casual;

-- 10. What is the distribution of bike types used by casual versus member riders?

WITH cte AS (
    SELECT member_casual,rideable_type,count(*) number_of_rides
    FROM dbo.rides_2024_cleaned
    GROUP BY member_casual, rideable_type
)
SELECT member_casual as CustomerType, rideable_type as BikeType, number_of_rides NumberOfRides,cast(number_of_rides as float)/ sum(number_of_rides) over (partition by member_casual) Ratio
FROM cte
ORDER BY member_casual, number_of_rides DESC;