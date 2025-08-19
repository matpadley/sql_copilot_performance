-- Index for Orders CustomerID
IF EXISTS (
    SELECT name FROM sys.indexes 
    WHERE name = 'IX_Orders_CustomerID' 
    AND object_id = OBJECT_ID('Orders')
)
    DROP INDEX IX_Orders_EmployeeID ON Orders;
GO

CREATE INDEX IX_Orders_CustomerID ON Orders(CustomerID);
GO
