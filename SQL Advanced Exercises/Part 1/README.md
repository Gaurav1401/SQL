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

