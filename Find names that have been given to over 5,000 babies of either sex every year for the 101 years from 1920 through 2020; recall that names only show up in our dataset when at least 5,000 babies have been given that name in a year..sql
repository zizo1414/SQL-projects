

 %%sql
postgresql:///schools

-- Select all rows from the database
-- Display only ten results
SELECT *
FROM schools
LIMIT 10;




 %%sql

-- Count rows with percent_tested missing and total number of schools
SELECT COUNT(*) - COUNT(percent_tested) as num_tested_missing, COUNT(*) as num_schools
FROM schools;



 %%sql

-- Count the number of unique building_code values
SELECT COUNT(DISTINCT building_code) as num_school_buildings
FROM schools;




 %%sql

-- Select school and average_math
-- Filter for average_math 640 or higher
-- Display from largest to smallest average_math
SELECT school_name, average_math
FROM schools
WHERE average_math >= 640
ORDER BY average_math DESC;





 %%sql

-- Find lowest average_reading
SELECT MIN(average_reading) as lowest_reading
FROM schools;


 %%sql

-- Find the top score for average_writing
-- Group the results by school
-- Sort by max_writing in descending order
-- Reduce output to one school
SELECT school_name, MAX(average_writing) as max_writing
FROM schools
GROUP BY school_name
ORDER BY max_writing DESC




 %%sql

-- Calculate average_sat
-- Group by school_name
-- Sort by average_sat in descending order
-- Display the top ten results
SELECT school_name, SUM(average_math + average_reading + average_writing) as average_sat
FROM schools
GROUP BY school_name
ORDER BY average_sat DESC
LIMIT 10;




   %%sql

-- Calculate average_sat
-- Group by school_name
-- Sort by average_sat in descending order
-- Display the top ten results
SELECT  borough ,count(school_name)as num_schools, SUM(average_math + average_reading + average_writing) / COUNT(*) AS  average_borough_sat 
FROM schools
GROUP BY borough
ORDER BY average_borough_sat DESC
LIMIT 10;




 %%sql

-- Select school and average_math
-- Filter for schools in Brooklyn
-- Aggregate on school_name
-- Display results from highest average_math and restrict output to five rows
SELECT school_name,average_math
FROM schools
WHERE borough='Brooklyn'
GROUP BY school_name
ORDER BY  average_math DESC
LIMIT 5


