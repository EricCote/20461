

ALTER PROC GetNums3(@low AS BIGINT, @high AS BIGINT) 
AS
BEGIN 
   IF @High <  @low
       RAISERROR('Nombres inversés',19, 0 ) WITH LOG;
   PRINT @@ERROR;
   DECLARE @Compteur int = @low; 
   WHILE @compteur <= @high
    BEGIN
      PRINT @Compteur;
	  SET @Compteur += 1;
    END
    PRINT @@ERROR;
   RETURN 

END
 



