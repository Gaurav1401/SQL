## Weather Observation Station 7

Q1. **Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.**

```
SELECT DISTINCT city
FROM station
WHERE city REGEXP '[AEIOU]$';
```

## Weather Observation Station 8

Q2. **Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.**

```
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[aeiou].*[aeiou]$';
```

## Weather Observation Station 9

Q3. **Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.**

```
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[^aeiou]';
```

## Weather Observation Station 10

Q4. **Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.**

```
SELECT DISTINCT city 
FROM station
WHERE city REGEXP '[^aeiou]$'
```

## Weather Observation Station 11

Q5. **Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.**

```
SELECT DISTINCT city
FROM station
WHERE city REGEXP '^[^aeiou]' OR city REGEXP '[^aeiou]$';
```

## Weather Observation Station 12

Q6. **Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.**

```
SELECT DISTINCT city 
FROM station
WHERE city REGEXP '^[^aeiou].*[^aeiou]$';
```

## Higher Than 75 Marks

Q7. **Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.**

```
SELECT name
FROM students
WHERE marks > 75
ORDER BY RIGHT(name, 3), ID ASC;
```

## Employee Names

Q8. **Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.**

```
SELECT name
FROM employee
ORDER BY name;
```

## Employee Salaries

Q9. **Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000  per month who have been employees for less than 10 months. Sort your result by ascending employee_id.**

```
SELECT name
FROM employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id;
```




