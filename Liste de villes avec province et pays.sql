SELECT DISTINCT [City] AS Ville,
                P.[Name] AS Province, 
				C.[Name] AS Pays
FROM [Person].[Address] AS A
INNER JOIN [Person].[StateProvince] AS P
ON A.[StateProvinceID] = P.StateProvinceID
INNER JOIN [Person].[CountryRegion] AS C
ON P.CountryRegionCode = C.CountryRegionCode
--WHERE City is NULL;





















