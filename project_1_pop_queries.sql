-- How many entries in the countries table are from Africa?
SELECT COUNT(continent) AS "Count"
FROM countries
WHERE continent = "Africa";

-- What was the total population of Oceania in 2005?
SELECT continent,
SUM(population_years.population) AS "Total Population"
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
WHERE population_years.year = 2005
GROUP BY continent
HAVING continent = "Oceania";

-- What is the average population of countries in South America in 2003? 
SELECT AVG(population) AS "Average population",
	countries.name AS "Country"
FROM population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE countries.continent = "South America"
AND population_years.year = 2003
GROUP BY countries.name
ORDER BY 1 DESC;

-- What country had the smallest population in 2007?
SELECT MIN(population) AS "Population",
	countries.name AS "Country"
FROM population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE year = 2007;

--What is the average population of Poland during the time period covered by this dataset?
SELECT AVG(population) AS "Average Population"
FROM population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE countries.name = "Poland";

-- How many countries have the word "The" in their name?
SELECT COUNT(*)
FROM countries
WHERE name LIKE "% The%";

-- What was the total population of each continent in 2010?
SELECT countries.continent,
	SUM(population) AS "Total population"
FROM population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE year = 2010
GROUP BY countries.continent;