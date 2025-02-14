SELECT 
    country.Name AS CountryName,
    city.Name AS CapitalName,
    JSON_EXTRACT(countryinfo.doc, '$.GNP') AS GNP
FROM 
    country 
JOIN 
    city  ON country.Capital = city.ID
JOIN 
    countryinfo ON JSON_EXTRACT(countryinfo.doc, '$.CountryCode') = country.Code
WHERE 
    JSON_EXTRACT(countryinfo.doc, '$.GNP') = (
        SELECT 
            MAX(JSON_EXTRACT(doc, '$.GNP'))
        FROM 
            countryinfo
        WHERE 
            JSON_EXTRACT(doc, '$.GNP') IS NOT NULL
    );

SELECT 
	JSON_EXTRACT(countryinfo.doc, '$.Continent') AS Continent,
    ROUND(avg(JSON_EXTRACT(countryinfo.doc, '$.GNP')),2) AS AverageValue,
    min(JSON_EXTRACT(countryinfo.doc, '$.GNP')) AS Min_value,
    max(JSON_EXTRACT(countryinfo.doc, '$.GNP')) AS Max_value
FROM
	countryinfo
GROUP BY 
    JSON_EXTRACT(countryinfo.doc, '$.Continent');
    
SELECT 
	city.Name As Name
FROM 
	city
JOIN 
	countryinfo ON city.CountryCode = JSON_EXTRACT(countryinfo.doc, '$.CountryCode')
WHERE 
	JSON_EXTRACT(countryinfo.doc, '$.Continent') = 'North America';
    
SELECT 
	country.Name as Name
FROM 
	country
JOIN
	countryinfo ON country.Code = JSON_EXTRACT(countryinfo.doc, '$.CountryCode')
WHERE 
	JSON_EXTRACT(countryinfo.doc, '$.HeadOfState') LIKE '%Elisabeth%';

SELECT 
	JSON_EXTRACT(countryinfo.doc, '$.Continent') AS Continent,
    COUNT(JSON_EXTRACT(countryinfo.doc, '$.CountryCode')) AS Count
FROM 
	countryinfo
GROUP BY
	JSON_EXTRACT(countryinfo.doc, '$.Continent');
    
SELECT
	country.Name AS CountryName,
    JSON_EXTRACT(countryinfo.doc, '$.LifeExpectancy') AS LifeExpectancy
FROM 
	country
JOIN 
	countryinfo ON country.Code = JSON_EXTRACT(countryinfo.doc, '$.CountryCode')
ORDER BY 
	JSON_EXTRACT(countryinfo.doc, '$.LifeExpectancy') ASC
LIMIT 10;

SELECT
	country.Name AS CountryName,
    JSON_EXTRACT(countryinfo.doc, '$.LifeExpectancy') AS LifeExpectancy
FROM 
	country
JOIN 
	countryinfo ON country.Code = JSON_EXTRACT(countryinfo.doc, '$.CountryCode')
ORDER BY 
	JSON_EXTRACT(countryinfo.doc, '$.LifeExpectancy') DESC
LIMIT 10;

