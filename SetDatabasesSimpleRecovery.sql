DECLARE @sql NVARCHAR(MAX)
  ,@db SYSNAME

DECLARE cur CURSOR for
  SELECT d.[name]
  FROM  sys.databases d
  WHERE d.database_id > 4
    AND d.recovery_model != 3
  
OPEN cur
  FETCH NEXT
  FROM  cur INTO @db
   
  WHILE @@FETCH_STATUS = 0
    BEGIN

    SET @sql = 'ALTER DATABASE' + ' ' + @db + ' ' + 'SET RECOVERY SIMPLE;'

    --PRINT @sql
    EXEC sp_executesql @sql
    FETCH NEXT
    FROM  cur INTO @db
    END
CLOSE cur
DEALLOCATE cur