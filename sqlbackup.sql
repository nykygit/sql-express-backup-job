/* ========================================
BACKUP FILE RETENTION OPTIONS
1. 1 BAK file for each database, overwrite each time - dbName.BAK (schedule this as often as you want)
2. 1 BAK file for each database + each day of the week - dbName_Monday.BAK, dbname_Tuesday.BAK, etc.. (schedule this daily)
3. 1 BAK file for each database + each day of the month - dbName_1.BAK, dbName_2.BAK, etc...to 31.BAK (schedule this daily)
4. 1 BAK file for each week of the year (schedule this as often as you want, eg daily, but at least once a week)
======================================== */

DECLARE @RetentionMethod int
SET @RetentionMethod = 1

/* ========== RUNTIME ========== */

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

