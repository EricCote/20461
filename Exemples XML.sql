
SELECT * FROM Person.CountryRegion
FOR XML PATH('Pays'), ROOT('Racine')

SELECT * FROM Person.CountryRegion
FOR XML AUTO, ROOT('Racine')



SELECT Firstname, lastname, Demographics.query('
   declare namespace d="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey";

   for $step in /d:IndividualSurvey/d:Education
   return string($step)')

  FROM Person.Person 
WHERE Demographics.exist (' 
declare namespace d="http://schemas.microsoft.com/sqlserver/2004/07/adventure-works/IndividualSurvey";
/d:IndividualSurvey/d:Education') = 1
