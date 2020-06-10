# SQL Express Backup Job

SQL Server Express Edition doesn't have a SQL Agent Service to schedule jobs like SQL Server Standard, Enterprise, or Developer Edition.  These scripts allow you to easily backup all databases on a SQL Express instance to local disk via Windows Task Scheduler.

## Disclaimer

The sqlbackup_basic.bat script contains the SQL Login + Password of a SQL Login with db_backupoperator role in clear text.  If the Script, Windows Task, SQL Express Database Engine, SQL Database Files, and Backup File Output are all being run on the same server, then we are trusting that the server is secure - physical access, network access, operating system access.  All said and done, don't do it.  Use Windows Authentication below.  Security has layers for a reason.

The sqlbackup_integrated.bat script is the preferred option.  This runs the SQLCMD as the user running the task.  You will need to create a Windows User, either Local / Domain, or a Domain Managed Service Account and then configure the Task Scheduler to run the batch file as this user.  The Managed Service Account option requires some use of the command line.

## Feature Limitations

- This is a simple backup solution.
- The backup files automatically get overwritten.
- The retention of the backup files = the frequency of the Task Schedule.
