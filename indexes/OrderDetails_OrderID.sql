IF EXISTS (
    SELECT name FROM sys.indexes 
    WHERE name = 'IX_OrderDetails_OrderID' 
    AND object_id = OBJECT_ID('OrderDetails')
)
    DROP INDEX IX_OrderDetails_OrderID ON OrderDetails;
GO
-- Index for OrderDetails OrderID
CREATE INDEX IX_OrderDetails_OrderID ON OrderDetails(OrderID);
GO
