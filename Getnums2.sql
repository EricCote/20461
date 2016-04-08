

CREATE FUNCTION GetNums2(@low AS BIGINT, @high AS BIGINT) 
RETURNS @t TABLE (num int)
AS
BEGIN 
   DECLARE @Compteur int = @low; 
   WHILE @compteur <= @high
    BEGIN
      INSERT @t (num) VALUES (@Compteur)
	  SET @Compteur +=  1;
    END
   RETURN 
END
 
