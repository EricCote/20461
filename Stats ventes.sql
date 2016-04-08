SELECT year(OrderDate), SUM(SubTotal)
FROM Sales.SalesOrderHeader
GROUP BY year(OrderDate)
ORDER BY SUM(SubTotal) desc

SET LANGUAGE FRENCH
SELECT datename(M, OrderDate), SUM(SubTotal)
FROM Sales.SalesOrderHeader
GROUP BY datename(M, OrderDate)
ORDER BY SUM(SubTotal) desc

SET LANGUAGE FRENCH
SELECT MONTH(OrderDate), CONCAT(datename(M, OrderDate), '-', year(OrderDate) ), SUM(SubTotal)
FROM Sales.SalesOrderHeader
GROUP BY year(OrderDate),MONTH(OrderDate),CONCAT(datename(M, OrderDate), '-', year(OrderDate) )
ORDER BY year(OrderDate) DESC ,MONTH(OrderDate) desc

SELECT year(OrderDate), SUM((UnitPrice*OrderQty)-(p.StandardCost*OrderQty)) AS PROFIT
FROM Sales.SalesOrderHeader AS oh 
join Sales.SalesOrderDetail AS od 
ON oh.SalesOrderID=od.SalesOrderID
join [Production].[Product] AS p 
ON od.ProductID=p.ProductID
GROUP BY year(OrderDate)
ORDER BY PROFIT
GO
CREATE VIEW BestColors
AS
SELECT FORMAT(Sum(OrderQty * UnitPrice),'C2','ja-JP') AS Revenus, Color, year(OrderDate) AS Annee
FROM Sales.SalesOrderHeader AS oh 
join Sales.SalesOrderDetail AS od 
ON oh.SalesOrderID=od.SalesOrderID
join [Production].[Product] AS p 
ON od.ProductID=p.ProductID
GROUP BY year(OrderDate), Color
HAVING Color = (
				SELECT TOP(1) Color
				FROM Sales.SalesOrderHeader AS oh1 
				join Sales.SalesOrderDetail AS od1 
				ON oh1.SalesOrderID=od1.SalesOrderID
				join [Production].[Product] AS p1 
				ON od1.ProductID=p1.ProductID
				WHERE YEAR(OrderDate) = YEAR(oh.OrderDate)
				GROUP BY Color
				ORDER BY Sum(OrderQty * UnitPrice) DESC 
				)
--Order BY year(OrderDate), Revenus desc;
GO





SELECT * FROM BestColors
ORDER BY Revenus




















SELECT        SUM(od.OrderQty * od.UnitPrice) AS Revenu, p.Name, p.ListPrice, YEAR(oh.OrderDate) AS Année
FROM            Sales.SalesOrderHeader AS oh INNER JOIN
                         Sales.SalesOrderDetail AS od ON oh.SalesOrderID = od.SalesOrderID RIGHT OUTER JOIN
                         Production.Product AS p ON od.ProductID = p.ProductID
WHERE        (p.ListPrice > 0)
GROUP BY YEAR(oh.OrderDate), p.Name, p.ListPrice
ORDER BY Année, Revenu DESC

SELECT SP.SalesQuota, OD.CarrierTrackingNumber, OD.OrderQty, OH.OrderDate
FROM  Sales.SalesPerson AS SP 
INNER JOIN Sales.SalesOrderHeader AS OH 
ON SP.BusinessEntityID = OH.SalesPersonID 
INNER JOIN Sales.SalesOrderDetail AS OD 
ON OH.SalesOrderID = OD.SalesOrderID






