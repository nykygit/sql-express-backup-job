@echo Running the SQL Backup Job
@echo replace "xxxxxxxxx"  with "password"

sqlcmd.exe -S localhost -Usqlbackup -Pxxxxxxxxx -i C:\SQLBACKUP\sqlbackup.sql -o C:\SQLBACKUP\results.log

exit

