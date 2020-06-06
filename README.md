# SQL Express Backup Job

SQL Server Express Edition doesn't have a SQL Agent Service to schedule jobs like SQL Server Standard, Enterprise, or Developer Edition.  These scripts allow you to easily backup all databases on a SQL Express instance to local disk via Windows Task Scheduler.

## Disclaimer

The script contains the SQL Login + Password of a SQL Login with db_backupoperator role in clear text.  The Script, Windows Task, SQL Express Database Engine, SQL Database Files, and Backup File Output are all being run on the same server.  We are trusting that the server  is secure - physical access, network access, operating system access.  If you have specific security requirements, then modify things as needed.

## Feature Limitations

This is a simple backup solution.  The backup files automatically get overwritten.  The retention of the backup files = the frequency of the Task Schedule.  This can be useful if the actual backup file or database get's corrupted, or primary physical disk dies, etc.  If you have additional needs, please modify.
