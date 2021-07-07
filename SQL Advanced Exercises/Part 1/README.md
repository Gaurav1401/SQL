# Type of Triangle

Q1. **Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:**
```
SELECT CASE
        WHEN A+B <= C OR A+C <= B OR C+B <= A THEN 'Not A Triangle'
        WHEN A = B AND A = C THEN 'Equilateral'
        WHEN A = B OR A = C OR B = C THEN 'Isosceles'
        ELSE 'Scalene'
END 
FROM triangles;
```

# The PADS

Q2 **Generate the following two result sets:**
 - **Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).**
 - **Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:**
   ```There are a total of [occupation_count] [occupation]s.```
   
```
select concat(name,concat('(', concat(substr(occupation,1,1),')'))) 
from occupations 
order by name;

select concat('There are a total of',concat(' ',concat(count(occupation),concat(' ',concat(lower(occupation),'s.'))))) as total 
from occupations
group by occupation 
order by total;
```
The approach that i used and worked on the MYSQL workbench but not on Hackerrank is:
```
SELECT CONCAT(NAME,' ',"("+ SUBSTRING(occupation, 1, 1)+ ")")
FROM occupations
ORDER BY NAME ASC;

SELECT CONCAT('There are a total '," ",COUNT(occupation)," ", LOWER(occupation),"s.") AS total
FROM occupations
GROUP BY occupation
ORDER BY COUNT(occupation) ASC, occupation ASC;
```

# Binary Tree Nodes

Q3. **Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:**

 - Root: If node is root node.
 - Leaf: If node is leaf node.
 - Inner: If node is neither root nor leaf node.

```
SELECT CASE
    WHEN P IS NULL THEN CONCAT(N, ' Root')
    WHEN N IN (SELECT DISTINCT P FROM bst) THEN CONCAT(N, ' Inner')
    ELSE CONCAT(N, ' Leaf')
    END
FROM bst
ORDER BY N;
```
# New Companies

Q4. **Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.**

```
SELECT DISTINCT c.company_code, 
                c.founder, 
                COUNT(DISTINCT e.lead_manager_code),
                COUNT(DISTINCT e.senior_manager_code),
                COUNT(DISTINCT e.manager_code),
                COUNT(DISTINCT e.employee_code)
FROM Employee e
JOIN Company c
    ON c.company_code = e.company_code
GROUP BY c.company_code,c.founder
ORDER BY c.company_code;
```


   
