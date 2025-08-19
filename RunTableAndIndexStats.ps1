# Requires: PowerShell 5+, SQL Server module (SqlServer)
# This script runs table and index statistics queries and exports results to CSV

$server = "EMEA-PF3SJGFW\SQLEXPRESS" # Change if needed
$database = "PerformanceDemoDB"
$outputDir = ".github/database_performance"
$tableStatsQuery = Get-Content ".\support_scripts\GetTableStatistics.sql" -Raw
$indexStatsQuery = Get-Content ".\support_scripts\GetIndexStatistics.sql" -Raw

# Ensure output directory exists
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

# Run table statistics query
$tableStats = Invoke-Sqlcmd -ServerInstance $server -Database $database -Query $tableStatsQuery
$tableStats | Export-Csv -Path "$outputDir\TableStatistics.csv" -NoTypeInformation

# Run index statistics query
$indexStats = Invoke-Sqlcmd -ServerInstance $server -Database $database -Query $indexStatsQuery
$indexStats | Export-Csv -Path "$outputDir\IndexStatistics.csv" -NoTypeInformation
