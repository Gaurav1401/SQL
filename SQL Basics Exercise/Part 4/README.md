# Revising Aggregations - The Count Function

Q1. **Query a count of the number of cities in CITY having a Population larger than 100000**

```
SELECT COUNT(NAME) 
FROM city
WHERE population > 100000;
```

# Revising Aggregations - The Sum Function

Q2. **Query the total population of all cities in CITY where District is California.**

```
SELECT SUM(population)
FROM city
WHERE district = 'California';
```

# Revising Aggregations - Averages

Q3. **Query the average population of all cities in CITY where District is California.**

```
SELECT AVG(population)
FROM city
WHERE district = 'California';
```

# Average Population

Q4. **Query the average population for all cities in CITY, rounded down to the nearest integer.**

```
SELECT FLOOR(AVG(population))
FROM city;
```

# Japan Population

Q5. **Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.**

