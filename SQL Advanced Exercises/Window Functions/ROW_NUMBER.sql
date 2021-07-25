-- Exercise 1
-- Create a query with the following columns (feel free to borrow your code from Exercise 1 of the PARTITION BY exercises):

SELECT [ProductName] = p.[Name],
		p.[ListPrice],
		[ProductSubcategory] = ps.[Name],
		[ProductCategory] = pc.[Name]
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON ps.[ProductCategoryID] = pc.[ProductCategoryID];

-- Exercise 2
-- Enhance your query from Exercise 1 by adding a derived column called
-- "Price Rank " that ranks all records in the dataset by ListPrice, in descending order. 
-- That is to say, the product with the most expensive price should have a rank of 1, 
-- and the product with the least expensive price should have a rank equal to the number of records in the dataset.

SELECT [ProductName] = p.[Name],
		p.[ListPrice],
		[ProductSubcategory] = ps.[Name],
		[ProductCategory] = pc.[Name],
		[Price Rank] = ROW_NUMBER() OVER(ORDER BY p.[ListPrice] DESC)
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON ps.[ProductCategoryID] = pc.[ProductCategoryID];

-- Exercise 3
-- Enhance your query from Exercise 2 by adding a derived column called
-- "Category Price Rank" that ranks all products by ListPrice – within each category - in descending order.
-- In other words, every product within a given category should be ranked relative to other products in the same category.

SELECT [ProductName] = p.[Name],
		p.[ListPrice],
		[ProductSubcategory] = ps.[Name],
		[ProductCategory] = pc.[Name],
		[Price Rank] = ROW_NUMBER() OVER(ORDER BY p.[ListPrice] DESC),
		[Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY pc.[Name] ORDER BY p.[ListPrice] DESC)
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON ps.[ProductCategoryID] = pc.[ProductCategoryID];

-- Exercise 4
-- Enhance your query from Exercise 3 by adding a derived column called
-- "Top 5 Price In Category" that returns the string “Yes” 
-- if a product has one of the top 5 list prices in its product category, and “No” if it does not.
-- You can try incorporating your logic from Exercise 3 into a CASE statement to make this work.

SELECT [ProductName] = p.[Name],
		p.[ListPrice],
		[ProductSubcategory] = ps.[Name],
		[ProductCategory] = pc.[Name],
		[Price Rank] = ROW_NUMBER() OVER(ORDER BY p.[ListPrice] DESC),
		[Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY pc.[Name] ORDER BY p.[ListPrice] DESC),
		[Top 5 Price In Category] = 
			CASE 
				WHEN ROW_NUMBER() OVER(PARTITION BY pc.[Name] ORDER BY p.[ListPrice] DESC) <= 5 THEN 'YES'
				ELSE 'NO'
			END
FROM [AdventureWorks2019].[Production].[Product] AS p
JOIN [AdventureWorks2019].[Production].[ProductSubcategory] AS ps
	ON p.[ProductSubcategoryID] = ps.[ProductSubcategoryID]
JOIN [AdventureWorks2019].[Production].[ProductCategory] AS pc
	ON ps.[ProductCategoryID] = pc.[ProductCategoryID];