 
DECLARE  @Schema nvarchar(128), @Table nvarchar(128)
 
DECLARE Table_cursor CURSOR FOR 
 
SELECT OBJECT_SCHEMA_NAME(Object_ID, Db_id()), 
		OBJECT_NAME(Object_ID)
FROM Sys.dm_db_partition_stats
WHERE Index_id<2  -- on veut l'index pincipal (1=clustered index, 0=heap)
AND Object_ID > 200
AND OBJECT_SCHEMA_NAME(Object_ID, Db_id())<>'sys' --On enlève les objets systemes
AND row_count=0 ;


OPEN Table_cursor

FETCH NEXT FROM Table_cursor 
INTO @Schema, @Table

IF @@FETCH_STATUS = -1
   PRINT 'Pas de table vide'

WHILE @@FETCH_STATUS = 0
BEGIN
   EXEC ('DROP TABLE ' + @Schema + '.' +  @Table );
   FETCH NEXT FROM Table_cursor 
      INTO @Schema, @Table
END
CLOSE Table_cursor;
DEALLOCATE Table_cursor;

















