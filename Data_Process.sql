-- Data Cleaning

-- Create new database 'cyclistic' and import the CSV file to the database

CREATE DATABASE cyclistic;

-- After importing the data into table 'dbo.rides_2024', check for duplicates (the original dataset contains (5906269, 13))

SELECT DISTINCT * FROM dbo.rides_2024; -- the dataset contains 5906269 rows, can't duplicate found

SELECT DISTINCT ride_id FROM dbo.rides_2024; -- there are 5906058 row - 211 duplicated ride_id found

-- Display the duplicated rows to identify if this is actually duplicates

SELECT * 
FROM dbo.rides_2024
WHERE ride_id in (
    SELECT ride_id
    FROM dbo.rides_2024
    GROUP BY ride_id
    HAVING COUNT(*) > 1
    )
ORDER BY ride_id

-- Remove all duplicated rows
UPDATE dbo.rides_2024
SET 
    started_at = CONVERT(varchar(19), started_at, 120),
    ended_at = CONVERT(varchar(19), ended_at, 120);

SELECT DISTINCT *
INTO rides_2024_cleaned
FROM rides_2024;

DROP TABLE rides_2024;

-- Create new column day_of_a_week

ALTER TABLE dbo.rides_2024_cleaned
ADD day_of_a_week AS DATENAME(WEEKDAY, started_at);

-- Create new column duration for ride length ('HH:MM:SS')

ALTER TABLE dbo.rides_2024_cleaned
ADD duration_seconds INT;

UPDATE dbo.rides_2024_cleaned
SET duration_seconds = DATEDIFF(SECOND, started_at, ended_at);

ALTER TABLE dbo.rides_2024_cleaned
ADD duration VARCHAR(8);

UPDATE dbo.rides_2024_cleaned
SET duration = 
    RIGHT('00' + CAST(duration_seconds / 3600 AS VARCHAR), 2) + ':' + 
    RIGHT('00' + CAST((duration_seconds % 3600) / 60 AS VARCHAR), 2) + ':' +
    RIGHT('00' + CAST(duration_seconds % 60 AS VARCHAR), 2);

ALTER TABLE dbo.rides_2024_cleaned
DROP column duration_seconds;

-- Remove rows if started_at is greater than or equal to ended_at

BEGIN TRANSACTION;
DELETE FROM dbo.rides_2024_cleaned
WHERE started_at >= ended_at;
COMMIT;


