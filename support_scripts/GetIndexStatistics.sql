-- Get statistics for all indexes in the current database
SELECT 
    t.name AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    i.is_primary_key,
    i.is_unique,
    s.user_seeks,
    s.user_scans,
    s.user_lookups,
    s.user_updates,
    s.last_user_seek,
    s.last_user_scan,
    s.last_user_lookup,
    s.last_user_update
FROM 
    sys.tables t
    INNER JOIN sys.indexes i ON t.object_id = i.object_id
    LEFT JOIN sys.dm_db_index_usage_stats s 
        ON i.object_id = s.object_id AND i.index_id = s.index_id AND s.database_id = DB_ID()
WHERE 
    t.is_ms_shipped = 0
ORDER BY 
    t.name, i.name;
