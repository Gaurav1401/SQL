## Revising the Select Query I

Q1. **Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.**

```
  SELECT * 
  FROM city
  WHERE population > 100000 AND countrycode = 'USA';
```

## Revising the Select Query II

Q2. **Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.**

```
SELECT name 
FROM city 
WHERE population > 120000 AND countrycode = 'USA';
```

## Select All

Q3. **Query all columns (attributes) for every row in the CITY table.**

```
SELECT *
FROM city;
```

## Select By ID

Q4. **Query all columns for a city in CITY with the ID 1661.**

```
SELECT *
FROM city
WHERE id = 1661;
```

## Japanese Cities' Attributes

Q5. **Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.**

```
SELECT *
FROM city
WHERE countrycode = 'JPN';
```

## Japanese Cities' Names

Q6. **Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.**

```
SELECT name
FROM city
WHERE countrycode = 'JPN';
```

## Weather Observation Station 1

Q7. **Query a list of CITY and STATE from the STATION table.**

```
SELECT city, state
FROM station;
```

## Weather Observation Station 3

Q8. **Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.**

```
SELECT DISTINCT city 
FROM station 
WHERE MOD(id,2) = 0;
```

## Weather Observation Station 4

Q9. **Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.**

```
SELECT COUNT(city) - COUNT(DISTINCT city)
FROM station;
```

## Weather Observation Station 6

Q10. **Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.**

```
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[AEIOU]';
```

