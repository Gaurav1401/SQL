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






