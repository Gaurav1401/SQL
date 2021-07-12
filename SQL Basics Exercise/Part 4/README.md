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

```
SELECT SUM(population)
FROM city
where countrycode = 'JPN';
```

# Population Density Difference

Q6. **Query the difference between the maximum and minimum populations in CITY.**

```
SELECT MAX(population) - MIN(population) AS difference
FROM city;
```

# The Blunder

Q7. **Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
Write a query calculating the amount of error (i.e.:actual - miscalculated  average monthly salaries), and round it up to the next integer.**

```
SELECT CEIL(AVG(salary) - AVG(REPLACE(salary, 0, '')))
FROM employees;
```

# Top Earners

Q8. **We define an employee's total earnings to be their monthly salary X months  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.**

```
SELECT MAX(months * salary) AS 'Total Earnings', COUNT(employee_id)
FROM employee
GROUP BY months * salary
ORDER BY months * salary DESC
LIMIT 1;
```

# Weather Observation Station 2

Q9. **Query the following two values from the STATION table:**
 - The sum of all values in LAT_N rounded to a scale of 2 decimal places.
 - The sum of all values in LONG_W rounded to a scale of 2 decimal places.

```
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)
FROM station;
```

# Weather Observation Station 13

Q10. **Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880  and less than 137.2345. Truncate your answer to 4 decimal places.**

```
SELECT ROUND(SUM(lat_n), 4)
FROM STATION
WHERE lat_n > 38.7880 AND lat_n <137.2345;
```

# Weather Observation Station 14

Q11. **Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.**

```
SELECT ROUND(MAX(lat_n), 4)
FROM station
WHERE lat_n < 137.2345;
```

# Weather Observation Station 15

Q12. **Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.**

```
SELECT ROUND(long_w,4)
FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;
```

# Weather Observation Station 16

Q13. **Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.**

```
SELECT ROUND(MIN(lat_n),4)
FROM station
WHERE lat_n >38.7780;
```

# Weather Observation Station 17

Q14. **Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.**

```
SELECT ROUND(long_w,4)
FROM station
WHERE lat_n > 38.7780
ORDER BY lat_n ASC
LIMIT 1;
```

#  Weather Observation Station 18

Q15. **Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.
  - a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
  - b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
  - c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
  - d happens to equal the maximum value in Western Longitude (LONG_W in STATION).
**Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.**

```
SELECT ROUND(ABS(MAX(lat_n) - MIN(lat_n)) + ABS(MAX(long_w) - MIN(long_w)),4)
FROM station;
```

# Weather Observation Station 19

Q16. **Query the Euclidean Distance between points P1 and P2 and round it to a scale of 4 decimal places.**

```
SELECT ROUND(SQRT(POWER(MAX(lat_n) - MIN(lat_n), 2) + POWER(MAX(long_w) - MIN(long_w), 2)),4)
FROM station;
```

