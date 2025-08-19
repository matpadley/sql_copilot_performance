IF EXISTS (
    SELECT name FROM sys.indexes 
    WHERE name = 'IX_Orders_EmployeeID' 
    AND object_id = OBJECT_ID('Orders')
)
    DROP INDEX IX_Orders_EmployeeID ON Orders;
GO
-- Index for Orders EmployeeID
CREATE INDEX IX_Orders_EmployeeID ON Orders(EmployeeID);

GO