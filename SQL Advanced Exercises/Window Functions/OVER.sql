-- Exercise 1
-- FirstName and LastName, from the Person.Person table
SELECT [FirstName],
		[LastName]
FROM [AdventureWorks2019].[Person].[Person];

-- JobTitle, from the HumanResources.Employee table
SELECT [JobTitle]
FROM [AdventureWorks2019].[HumanResources].[Employee];

-- Rate, from the HumanResources.EmployeePayHistory table
SELECT [Rate]
FROM [AdventureWorks2019].[HumanResources].[EmployeePayHistory];

-- A derived column called "AverageRate" that returns the average of all values in the "Rate" column, in each row
SELECT [Rate], 
		[Average Rate] = AVG([Rate]) OVER()
FROM [AdventureWorks2019].[HumanResources].[EmployeePayHistory];

-- Combining all the above queries
SELECT p.[FirstName],
		p.[LastName],
		e.[JobTitle],
		eph.[Rate],
		[Average Rate] = AVG(eph.[Rate]) OVER()
FROM [AdventureWorks2019].[Person].[Person] AS p
JOIN [AdventureWorks2019].[HumanResources].[Employee] AS e
	ON p.BusinessEntityID = e.BusinessEntityID
JOIN [AdventureWorks2019].[HumanResources].[EmployeePayHistory] AS eph
	ON p.BusinessEntityID = eph.BusinessEntityID;


-- Exercise 2
-- Enhance your query from Exercise 1 by adding a derived column called
-- "MaximumRate" that returns the largest of all values in the "Rate" column, in each row

SELECT p.[FirstName],
		p.[LastName],
		e.[JobTitle],
		eph.[Rate],
		[Average Rate] = AVG(eph.[Rate]) OVER(),
		[MaximumRate] = MAX(eph.[Rate]) OVER()
FROM [AdventureWorks2019].[Person].[Person] AS p
JOIN [AdventureWorks2019].[HumanResources].[Employee] AS e
	ON p.BusinessEntityID = e.BusinessEntityID
JOIN [AdventureWorks2019].[HumanResources].[EmployeePayHistory] AS eph
	ON p.BusinessEntityID = eph.BusinessEntityID;


-- Exercise 3
-- Enhance your query from Exercise 2 by adding a derived column called
-- "DiffFromAvgRate" that returns the result of the following calculation:
-- An employees's pay rate, MINUS the average of all values in the "Rate" column.

SELECT p.[FirstName],
		p.[LastName],
		e.[JobTitle],
		eph.[Rate],
		[Average Rate] = AVG(eph.[Rate]) OVER(),
		[MaximumRate] = MAX(eph.[Rate]) OVER(),
		[DiffFromAvgRate] = eph.[Rate] - AVG(eph.[Rate])
FROM [AdventureWorks2019].[Person].[Person] AS p
JOIN [AdventureWorks2019].[HumanResources].[Employee] AS e
	ON p.BusinessEntityID = e.BusinessEntityID
JOIN [AdventureWorks2019].[HumanResources].[EmployeePayHistory] AS eph
	ON p.BusinessEntityID = eph.BusinessEntityID;