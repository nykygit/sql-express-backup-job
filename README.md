# sql-express-backup-job

SQL Express doesn't have a SQL Agent to schedule jobs like Standard Enterprise or Developer Edition.  These scripts allow you to easily backup all databases on a SQL Express instance.  We use Windows Task Scheduler to execute SQL via command line.

## Disclaimer

The script contains the SQL Login + Password of a SQL Login with db_backupoperator role in clear text.  The Script, Windows Task, SQL Express Database Engine, SQL Database Files, and Backup File Output are all being run on the same server.  We are trusting that the server  is secure - physical access, network access, operating system access.  If you have specific security requirements, then modify things as needed.

