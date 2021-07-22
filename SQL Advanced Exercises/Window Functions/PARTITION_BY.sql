-- Exercise 1
-- “Name” from the Production.Product table, which can be alised as “ProductName”
-- “ListPrice” from the Production.Product table
-- “Name” from the Production. ProductSubcategory table, which can be alised as “ProductSubcategory”*
-- “Name” from the Production. Category table, which can be alised as “ProductCategory”

SELECT [ProductName] = p.[Name],
	   p.[ListPrice],
	   [ProductSubcategory] = ps.[Name],
	   [ProductCategory] = pc.[Name]
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON pc.ProductCategoryID = ps.ProductCategoryID;




-- Exercise 2
-- Enhance your query from Exercise 1 by adding a derived column called
-- "AvgPriceByCategory " that returns the average ListPrice for the product category in each given row.

SELECT [ProductName] = p.[Name],
	   p.[ListPrice],
	   [ProductSubcategory] = ps.[Name],
	   [ProductCategory] = pc.[Name],
	   [AvgPriceByCategory] = AVG(p.[ListPrice]) OVER()
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON pc.ProductCategoryID = ps.ProductCategoryID;

-- Exercise 3
-- Enhance your query from Exercise 2 by adding a derived column called
-- "AvgPriceByCategoryAndSubcategory" that returns the average ListPrice for the product category AND subcategory in each given row.

SELECT [ProductName] = p.[Name],
	   p.[ListPrice],
	   [ProductSubcategory] = ps.[Name],
	   [ProductCategory] = pc.[Name],
	   [AvgPriceByCategory] = AVG(p.[ListPrice]) OVER(),
	   [AvgPriceByCategoryAndSubcategory] = AVG(p.[ListPrice]) OVER(PARTITION BY pc.[Name], ps.[Name])
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON pc.ProductCategoryID = ps.ProductCategoryID;


-- Exercise 4
-- Enhance your query from Exercise 3 by adding a derived column called
-- "ProductVsCategoryDelta" that returns the result of the following calculation:
-- A product's list price, MINUS the average ListPrice for that product’s category.

SELECT [ProductName] = p.[Name],
	   p.[ListPrice],
	   [ProductSubcategory] = ps.[Name],
	   [ProductCategory] = pc.[Name],
	   [AvgPriceByCategory] = AVG(p.[ListPrice]) OVER(),
	   [AvgPriceByCategoryAndSubcategory] = AVG(p.[ListPrice]) OVER(PARTITION BY pc.[Name], ps.[Name]),
	   [ProductVsCategoryDelta] = p.[ListPrice] - AVG(p.[ListPrice]) OVER(PARTITION BY pc.[Name])
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON pc.ProductCategoryID = ps.ProductCategoryID;