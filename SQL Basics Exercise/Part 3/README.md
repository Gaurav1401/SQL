# Population Census

Q1. **Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.**

```
SELECT SUM(ci.population)
FROM city ci
JOIN country co
    ON ci.countrycode = co.code
WHERE continent = 'Asia';
```

# African Cities

Q2. **Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.**

```
SELECT ci.name
FROM city ci
JOIN country co
    ON ci.countrycode = co.code
WHERE co.continent = 'Africa';
```

# Average Population of Each Continent

Q3. **Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.**

```
SELECT co.continent, FLOOR(AVG(ci.population))
FROM city ci
JOIN country co
    ON ci.countrycode = co.code
GROUP BY co.continent;
```

# The Report

Q4. **Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.**

```
SELECT IF(grade < 8, NULL, name), grade, marks
FROM students
JOIN grades
WHERE marks BETWEEN min_mark AND max_mark
ORDER BY grade DESC, name;
```
