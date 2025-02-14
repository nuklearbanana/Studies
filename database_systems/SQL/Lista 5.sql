
INSERT INTO city (ID, Name, CountryCode, District) VALUES
(21, 'Bangkok', 'THA', 'Bangkok'),
(22, 'Wellington', 'NZL', 'Wellington'),
(23, 'Jakarta', 'IDN', 'Jakarta'),
(24, 'Nairobi', 'KEN', 'Nairobi'),
(25, 'Ankara', 'TUR', 'Ankara'),
(26, 'Oslo', 'NOR', 'Oslo'),
(27, 'Helsinki', 'FIN', 'Uusimaa'),
(28, 'Stockholm', 'SWE', 'Stockholm County'),
(29, 'Warsaw', 'POL', 'Masovian'),
(30, 'Lisbon', 'PRT', 'Lisbon District');

INSERT INTO country (Code, Name, Code2, Capital) VALUES
('THA', 'Thailand', 'TH', 21),
('NZL', 'New Zealand', 'NZ', 22),
('IDN', 'Indonesia', 'ID', 23),
('KEN', 'Kenya', 'KE', 24),
('TUR', 'Turkey', 'TR', 25),
('NOR', 'Norway', 'NO', 26),
('FIN', 'Finland', 'FI', 27),
('SWE', 'Sweden', 'SE', 28),
('POL', 'Poland', 'PL', 29),
('PRT', 'Portugal', 'PT', 30);

INSERT INTO countrylanguage (CountryCode, Language, IsOfficial, Percentage) VALUES
('THA', 'Thai', 'T', 99.0),
('NZL', 'English', 'T', 98.0),
('IDN', 'Indonesian', 'T', 94.0),
('KEN', 'Swahili', 'T', 45.0),
('KEN', 'English', 'T', 40.0),
('TUR', 'Turkish', 'T', 100.0),
('NOR', 'Norwegian', 'T', 100.0),
('FIN', 'Finnish', 'T', 87.0),
('FIN', 'Swedish', 'T', 5.0),
('SWE', 'Swedish', 'T', 100.0),
('POL', 'Polish', 'T', 97.0),
('PRT', 'Portuguese', 'T', 99.0);

INSERT INTO countryinfo (doc) VALUES
(JSON_OBJECT('CountryCode', 'THA', 'GNP', 543.0, 'Continent', 'Asia', 'Region', 'Southeast Asia', 'HeadOfState', 'Maha Vajiralongkorn', 'LifeExpectancy', 76.5)),
(JSON_OBJECT('CountryCode', 'NZL', 'GNP', 205.0, 'Continent', 'Oceania', 'Region', 'Australia and New Zealand', 'HeadOfState', 'Chris Hipkins', 'LifeExpectancy', 82.4)),
(JSON_OBJECT('CountryCode', 'IDN', 'GNP', 1119.0, 'Continent', 'Asia', 'Region', 'Southeast Asia', 'HeadOfState', 'Joko Widodo', 'LifeExpectancy', 71.7)),
(JSON_OBJECT('CountryCode', 'KEN', 'GNP', 95.5, 'Continent', 'Africa', 'Region', 'Sub-Saharan Africa', 'HeadOfState', 'William Ruto', 'LifeExpectancy', 66.7)),
(JSON_OBJECT('CountryCode', 'TUR', 'GNP', 850.0, 'Continent', 'Asia', 'Region', 'Middle East', 'HeadOfState', 'Recep Tayyip Erdoğan', 'LifeExpectancy', 75.9)),
(JSON_OBJECT('CountryCode', 'NOR', 'GNP', 402.0, 'Continent', 'Europe', 'Region', 'Northern Europe', 'HeadOfState', 'Harald V', 'LifeExpectancy', 82.4)),
(JSON_OBJECT('CountryCode', 'FIN', 'GNP', 276.0, 'Continent', 'Europe', 'Region', 'Northern Europe', 'HeadOfState', 'Sauli Niinistö', 'LifeExpectancy', 81.9)),
(JSON_OBJECT('CountryCode', 'SWE', 'GNP', 530.0, 'Continent', 'Europe', 'Region', 'Northern Europe', 'HeadOfState', 'Carl XVI Gustaf', 'LifeExpectancy', 83.2)),
(JSON_OBJECT('CountryCode', 'POL', 'GNP', 595.0, 'Continent', 'Europe', 'Region', 'Eastern Europe', 'HeadOfState', 'Andrzej Duda', 'LifeExpectancy', 78.0)),
(JSON_OBJECT('CountryCode', 'PRT', 'GNP', 237.0, 'Continent', 'Europe', 'Region', 'Southern Europe', 'HeadOfState', 'Marcelo Rebelo de Sousa', 'LifeExpectancy', 81.6));

ALTER TABLE countryinfo
ADD COLUMN GovernmentForm CHAR(100) NOT NULL DEFAULT '';

UPDATE countryinfo SET GovernmentForm = 'Federal Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'USA';
UPDATE countryinfo SET GovernmentForm = 'Federal Parliamentary Democracy' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'CAN';
UPDATE countryinfo SET GovernmentForm = 'Federal Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'MEX';
UPDATE countryinfo SET GovernmentForm = 'Constitutional Monarchy' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'GBR';
UPDATE countryinfo SET GovernmentForm = 'Federal Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'DEU';
UPDATE countryinfo SET GovernmentForm = 'Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'FRA';
UPDATE countryinfo SET GovernmentForm = 'Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ITA';
UPDATE countryinfo SET GovernmentForm = 'Constitutional Monarchy' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ESP';
UPDATE countryinfo SET GovernmentForm = 'Federal Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'BRA';
UPDATE countryinfo SET GovernmentForm = 'Federal Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'IND';
UPDATE countryinfo SET GovernmentForm = 'Single-Party State' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'CHN';
UPDATE countryinfo SET GovernmentForm = 'Constitutional Monarchy' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'AUS';
UPDATE countryinfo SET GovernmentForm = 'Semi-Presidential Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'RUS';
UPDATE countryinfo SET GovernmentForm = 'Constitutional Monarchy' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'JPN';
UPDATE countryinfo SET GovernmentForm = 'Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'KOR';
UPDATE countryinfo SET GovernmentForm = 'Federal Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ARG';
UPDATE countryinfo SET GovernmentForm = 'Absolute Monarchy' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'SAU';
UPDATE countryinfo SET GovernmentForm = 'Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'EGY';
UPDATE countryinfo SET GovernmentForm = 'Republic' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ZAF';
UPDATE countryinfo SET GovernmentForm = 'Constitutional Monarchy' WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'NLD';


ALTER TABLE countryinfo
ADD COLUMN Continent CHAR(30) NOT NULL DEFAULT '';

UPDATE countryinfo
SET Continent = JSON_UNQUOTE(doc->'$.Continent');

SELECT * FROM countryinfo;

SET SQL_SAFE_UPDATES = 1;

ALTER TABLE countryinfo
ADD COLUMN IndepYear INT DEFAULT NULL;

UPDATE countryinfo SET IndepYear = 1776 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'USA';   
UPDATE countryinfo SET IndepYear = 1867 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'CAN';   
UPDATE countryinfo SET IndepYear = 1810 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'MEX';   
UPDATE countryinfo SET IndepYear = 1801 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'GBR';  
UPDATE countryinfo SET IndepYear = 1871 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'DEU';   
UPDATE countryinfo SET IndepYear = 843  WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'FRA';   
UPDATE countryinfo SET IndepYear = 1861 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ITA';   
UPDATE countryinfo SET IndepYear = 1492 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ESP';   
UPDATE countryinfo SET IndepYear = 1822 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'BRA';   
UPDATE countryinfo SET IndepYear = 1947 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'IND';   
UPDATE countryinfo SET IndepYear = 1949 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'CHN';   
UPDATE countryinfo SET IndepYear = 1901 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'AUS';   
UPDATE countryinfo SET IndepYear = 1991 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'RUS';   
UPDATE countryinfo SET IndepYear = 660  WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'JPN';   
UPDATE countryinfo SET IndepYear = 1945 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'KOR';   
UPDATE countryinfo SET IndepYear = 1816 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ARG';   
UPDATE countryinfo SET IndepYear = 1932 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'SAU';   
UPDATE countryinfo SET IndepYear = 1952 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'EGY';   
UPDATE countryinfo SET IndepYear = 1961 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'ZAF';   
UPDATE countryinfo SET IndepYear = 1648 WHERE JSON_UNQUOTE(doc->'$.CountryCode') = 'NLD';   

SELECT 
	country.Name AS Name,
    countryinfo.IndepYear AS Year
FROM 
	country 
JOIN countryinfo ON country.Code = JSON_EXTRACT(countryinfo.doc,'$.CountryCode')
ORDER BY countryinfo.IndepYear DESC;

SELECT 
	countrylanguage.Language AS Language,
    COUNT(*) AS OfficialCount
FROM 
	countrylanguage
WHERE countrylanguage.IsOfficial = 'T'
GROUP BY countrylanguage.Language
ORDER BY OfficialCount DESC;


ALTER TABLE countryinfo ADD Population INT DEFAULT NULL;
UPDATE countryinfo SET Population = 331002651 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'USA';
UPDATE countryinfo SET Population = 37742154 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'CAN';
UPDATE countryinfo SET Population = 126190788 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'MEX';
UPDATE countryinfo SET Population = 67886011 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'GBR';
UPDATE countryinfo SET Population = 83783942 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'DEU';
UPDATE countryinfo SET Population = 65273511 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'FRA';
UPDATE countryinfo SET Population = 60461826 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'ITA';
UPDATE countryinfo SET Population = 46754778 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'ESP';
UPDATE countryinfo SET Population = 212559417 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'BRA';
UPDATE countryinfo SET Population = 1380004385 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'IND';
UPDATE countryinfo SET Population = 1439323776 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'CHN';
UPDATE countryinfo SET Population = 25499884 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'AUS';
UPDATE countryinfo SET Population = 145934462 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'RUS';
UPDATE countryinfo SET Population = 126476461 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'JPN';
UPDATE countryinfo SET Population = 51269185 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'KOR';
UPDATE countryinfo SET Population = 45195774 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'ARG';
UPDATE countryinfo SET Population = 34813871 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'SAU';
UPDATE countryinfo SET Population = 102334404 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'EGY';
UPDATE countryinfo SET Population = 59308690 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'ZAF';
UPDATE countryinfo SET Population = 17134872 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'NLD';
UPDATE countryinfo SET Population = 69799978 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'THA';
UPDATE countryinfo SET Population = 4822233 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'NZL';
UPDATE countryinfo SET Population = 273523615 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'IDN';
UPDATE countryinfo SET Population = 53771296 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'KEN';
UPDATE countryinfo SET Population = 84339067 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'TUR';
UPDATE countryinfo SET Population = 5421241 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'NOR';
UPDATE countryinfo SET Population = 5540720 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'FIN';
UPDATE countryinfo SET Population = 10099265 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'SWE';
UPDATE countryinfo SET Population = 38386000 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'POL';
UPDATE countryinfo SET Population = 10196709 WHERE JSON_EXTRACT(doc, '$.CountryCode') = 'PRT';

SELECT 
    countrylanguage.Language,
    SUM(countryinfo.Population * (countrylanguage.Percentage / 100)) AS Populacja
FROM 
    countrylanguage 
JOIN 
    countryinfo 
ON 
    JSON_EXTRACT(countryinfo.doc, '$.CountryCode') = countrylanguage.CountryCode
GROUP BY 
    countrylanguage.Language
ORDER BY 
    Populacja DESC;


WITH TopGNP AS (
    SELECT 
        JSON_EXTRACT(doc, '$.CountryCode') AS CountryCode
    FROM 
        countryinfo
    ORDER BY 
        JSON_EXTRACT(doc, '$.GNP') DESC
    LIMIT 20
),
TopLifeExpectancy AS (
    SELECT 
        JSON_EXTRACT(doc, '$.CountryCode') AS CountryCode
    FROM 
        countryinfo
    ORDER BY 
        JSON_EXTRACT(doc, '$.LifeExpectancy') DESC
    LIMIT 20
)
SELECT 
    JSON_EXTRACT(countryinfo.doc, '$.CountryCode') AS CountryCode,
    JSON_EXTRACT(countryinfo.doc, '$.GNP') AS GNP,
    JSON_EXTRACT(countryinfo.doc, '$.LifeExpectancy') AS LifeExpectancy
FROM 
    countryinfo 
JOIN 
    TopGNP ON JSON_EXTRACT(countryinfo.doc, '$.CountryCode') = TopGNP.CountryCode
JOIN 
    TopLifeExpectancy ON JSON_EXTRACT(countryinfo.doc, '$.CountryCode') = TopLifeExpectancy.CountryCode
ORDER BY 
    GNP DESC, 
    LifeExpectancy DESC;

