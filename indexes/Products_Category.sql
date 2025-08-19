-- Index for Products Category
-- Index for Orders CustomerID
IF EXISTS (
    SELECT name FROM sys.indexes 
    WHERE name = 'IX_Products_Category' 
    AND object_id = OBJECT_ID('Orders')
)
    DROP INDEX IX_Orders_EmployeeID ON Orders;
GO
CREATE INDEX IX_Products_Category ON Products(Category);

GO