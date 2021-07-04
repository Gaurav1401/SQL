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

# Top Competitors

Q5. **Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.**

```
SELECT s.hacker_id, h.name
FROM submissions s
JOIN hackers h
    ON s.hacker_id = h.hacker_id 
JOIN challenges c
    ON c.challenge_id = s.challenge_id
JOIN difficulty d
    ON d.difficulty_level = c.difficulty_level
WHERE s.score = d.score AND c.difficulty_level = d.difficulty_level 
GROUP BY s.hacker_id, h.name
HAVING COUNT(s.challenge_id) > 1
ORDER BY COUNT(s.challenge_id) DESC, s.hacker_id ASC;
```

# Ollivander's Inventory

Q6. **Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand. Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.**

```
SELECT W.id, P.age, W.coins_needed, W.power
FROM WANDS AS W
    INNER JOIN WANDS_PROPERTY AS P ON W.code = P.code
WHERE P.is_evil = 0 AND W.coins_needed = 
    (SELECT MIN(coins_needed)
     FROM WANDS AS W1
        INNER JOIN WANDS_PROPERTY AS P1 ON W1.code = P1.code
     WHERE W1.power = W.power AND P1.age = P.age)
ORDER BY W.power DESC, P.age DESC
```


