USE AdventureWorks;

SELECT c.[Name] AS Category, 
	s.[Name] AS Subcategory,
	p.[Name] AS Product, 
	p.[ListPrice],
	p.[StandardCost],
	(p.[ListPrice]-p.[StandardCost]) AS Profit
FROM [Production].[Product] AS p 
INNER JOIN [Production].[ProductSubcategory] AS s
ON p.[ProductSubcategoryID] = s.[ProductSubcategoryID]
INNER JOIN [Production].[ProductCategory] AS c
ON s.[ProductCategoryID] = c.[ProductCategoryID]
ORDER BY Profit DESC;