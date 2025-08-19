-- Get statistics for all tables in the current database
SELECT 
    t.name AS TableName,
    SUM(p.rows) AS Row_Count,
    SUM(a.total_pages) * 8 AS TotalSpaceKB,
    SUM(a.used_pages) * 8 AS UsedSpaceKB,
    SUM(a.data_pages) * 8 AS DataSpaceKB
FROM 
    sys.tables t
    JOIN sys.indexes i ON t.object_id = i.object_id
    JOIN sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id
    JOIN sys.allocation_units a ON p.partition_id = a.container_id
WHERE 
    t.is_ms_shipped = 0
    AND i.index_id IN (0,1) -- Only heap or clustered index for row count
GROUP BY 
    t.name
ORDER BY 
    t.name;
