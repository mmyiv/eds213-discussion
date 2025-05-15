--Add cleaned tables to database

CREATE TABLE yield AS
SELECT item, item_code, value, unit, year, element, area
FROM read_csv_auto('yield.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

CREATE TABLE calendar AS
SELECT data_id, area, crop, plant_start_date, plant_end_date, plant_range, harvest_start_date, harvest_end_date, harvest_range
FROM read_csv_auto('calendar.csv', HEADER=TRUE, SAMPLE_SIZE=-1);

-- Create query

-- Ensure tables were added to database
.tables

-- View both tables
SELECT * FROM calendar;
SELECT * FROM yield;

-- Rename item to crop in yield table for join
ALTER TABLE yield RENAME COLUMN item TO crop;

-- Find average planting and harvest ranges
CREATE TEMPORARY TABLE calendar_avg AS
SELECT 
  area,
  crop,
  AVG(plant_range) AS avg_plant_range,
  AVG(harvest_range) AS avg_harvest_range
FROM calendar
GROUP BY data_id, area, crop;


-- Join tables as a temp table
CREATE TEMPORARY TABLE temp_calendar_yield AS
SELECT *
FROM yield
JOIN calendar_avg 
  ON yield.area = calendar_avg.area
  AND yield.crop = calendar_avg.crop;

-- View table
SELECT * FROM temp_calendar_yield;

-- make new table and save to database
CREATE TABLE crop_summary AS
SELECT
  crop,
  area,
ANY_VALUE(avg_plant_range) as avg_plant_range,
ANY_VALUE(avg_harvest_range) as avg_harvest_range,
  AVG(value) AS avg_yield,
FROM temp_calendar_yield
GROUP BY crop, area
ORDER BY crop, area;





-- 
SELECT 
    AVG(Temperature.temp_at_planting) AS avg_temp_at_planting, 
    AVG(Precipitation.precip_at_planting) AS avg_precip_at_planting, 
    Country.country, 
    AVG(value) AS avg_yield
    FROM Temperature 
    JOIN Precipitation USING (data_id)
    JOIN CropYields USING (data_id)
    JOIN Country ON CropYields.location_code = Country.location_code
    JOIN Products
        ON Country.country = Products.country
        AND Temperature.crop = Products.item
        AND Products.element = 'Yield'
    WHERE Temperature.crop LIKE 'Wheat%' 
    GROUP BY Country.country
    ORDER BY avg_yield DESC
    LIMIT 5;

