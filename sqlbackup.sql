
DECLARE @ProdDatabaseName varchar(256)
DECLARE @ProdDatabasePath varchar(256)
DECLARE @ProdDatabaseFileName varchar(256)

SET @ProdDatabasePath = 'C:\SQLBACKUP\'


DECLARE c1 CURSOR READ_ONLY FOR
  SELECT name
  FROM master.sys.databases
  WHERE
    name NOT IN ('tempdb')
    AND state = 0 AND
    AND is_in_standby = 0
OPEN c1
FETCH NEXT FROM c1 INTO @ProdDatabaseName
WHILE @@FETCH_STATUS = 0
BEGIN
  SET @ProdDatabaseFileName = @ProdDatabasePath + @ProdDatabaseName + '.BAK'
  BACKUP DATABASE @ProdDatabaseName TO DISK = @ProdDatabaseFileName WITH COPY_ONLY, INIT
  FETCH NEXT FROM c1 INTO @ProdDatabaseName
END
CLOSE c1
DEALLOCATE c1

