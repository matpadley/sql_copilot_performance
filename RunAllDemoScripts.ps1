param (
    [string]$SqlServerInstance = "EMEA-PF3SJGFW\SQLEXPRESS",
    [string]$DatabaseName = "DemoPerformanceDB"
)

Invoke-Sqlcmd -ServerInstance $SqlServerInstance -InputFile ".\CreateDatabase.sql" -ErrorAction Stop
