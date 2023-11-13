%%sql 
postgresql:///oldestbusinesses
 
-- Select the oldest and newest founding years from the businesses table
SELECT MIN(year_founded), MAX(year_founded)
    FROM businesses;


 %%sql

-- Get the count of rows in businesses where the founding year was before 1000
SELECT COUNT(*)
    FROM businesses
    WHERE year_founded < 1000;



 %%sql

-- Select all columns from businesses where the founding year was before 1000
-- Arrange the results from oldest to newest
SELECT *
  FROM businesses
  WHERE year_founded < 1000
  ORDER BY year_founded;




%%sql

-- Select business name, founding year, and country code from businesses; and category from categories
-- where the founding year was before 1000, arranged from oldest to newest
SELECT bus.business, bus.year_founded, bus.country_code, cat.category
    FROM businesses AS bus
    INNER JOIN categories AS cat
        ON bus.category_code = cat.category_code
    WHERE year_founded < 1000
    ORDER BY year_founded;




 %%sql

-- Select the category and count of category (as "n")
-- arranged by descending count, limited to 10 most common categories
SELECT cat.category, COUNT(cat.category) AS n
    FROM businesses AS bus
    INNER JOIN categories AS cat
        ON bus.category_code = cat.category_code
    GROUP BY cat.category
    ORDER BY n DESC
    LIMIT 10;



 %%sql

-- Select the oldest founding year (as "oldest") from businesses, 
-- and continent from countries
-- for each continent, ordered from oldest to newest
SELECT MIN(bus.year_founded) as oldest, cnt.continent
    FROM businesses AS bus
    INNER JOIN countries as cnt
        ON bus.country_code = cnt.country_code
    GROUP BY continent
    ORDER BY oldest;







 %%sql

-- Select the business, founding year, category, country, and continent
SELECT bus.business, bus.year_founded, cat.category, cnt.country, cnt.continent
    FROM businesses AS bus
    INNER JOIN categories as cat
        ON bus.category_code = cat.category_code
    INNER JOIN countries as cnt
        ON bus.country_code = cnt.country_code;










 %%sql

-- Count the number of businesses in each continent and category
SELECT cnt.continent, cat.category, COUNT(*) AS n
    FROM businesses AS bus
    INNER JOIN categories as cat
        ON bus.category_code = cat.category_code
    INNER JOIN countries as cnt
        ON bus.country_code = cnt.country_code
    GROUP BY cnt.continent, cat.category;











