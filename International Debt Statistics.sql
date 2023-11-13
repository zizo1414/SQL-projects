

-- Task 1
SELECT 
    COUNT(DISTINCT international_debt.country_name) AS total_distinct_countries
FROM international_debt;

-- Task 2
SELECT 
    DISTINCT international_debt.indicator_code AS distinct_debt_indicators
FROM international_debt
ORDER BY distinct_debt_indicators;

-- Task 3
SELECT 
    ROUND(SUM(international_debt.debt)/1000000, 2) AS total_debt
FROM international_debt; 

-- Task 4
SELECT 
    international_debt.country_name, 
    SUM(international_debt.debt) AS total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

-- Task 5
SELECT 
    international_debt.indicator_code AS debt_indicator,
    international_debt.indicator_name,
    AVG(international_debt.debt) AS average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt DESC
LIMIT 10;

-- Task 6
SELECT 
    international_debt.country_name, 
    international_debt.indicator_name
FROM international_debt
WHERE debt = (SELECT 
                  MAX(debt)
              FROM international_debt
              WHERE indicator_code='DT.AMT.DLXF.CD');
