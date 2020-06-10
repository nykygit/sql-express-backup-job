# SQL Express Backup Job

SQL Server Express Edition doesn't have a SQL Agent Service to schedule jobs like SQL Server Standard, Enterprise, or Developer Edition.  These scripts allow you to easily backup all databases on a SQL Express instance to local disk via Windows Task Scheduler.

## Disclaimer

The sqlbackup_basic.bat script contains the SQL Login + Password of a SQL Login with db_backupoperator role in clear text.  If the Script, Windows Task, SQL Express Database Engine, SQL Database Files, and Backup File Output are all being run on the same server, we are trusting that the server  is secure - physical access, network access, operating system access.  If you have specific security requirements, then modify things as needed.

The sqlbackup_integrated.bat script is the preferred way to configure this.  This essentially runs SQLCMD as the user.  You have 3 options for creating a User/Service Account to run the task.  All 3 options are respectable, but the last option emphasizes security because there is no visible password involved.  The last option you may find bothersome if you aren't comfy with shell.  I've attached 3 Powershell scripts for each of these options.

1. Create a Local User and run the Windows Task as the Local User.
2. Create a Domain User and run the Windows Task as a Domain User.
3. Create a Domain Managed Service Account (MSA) and run the Windows Task as a the Service Account.

## Feature Limitations

- This is a simple backup solution.
- The backup files automatically get overwritten.
- The retention of the backup files = the frequency of the Task Schedule.
