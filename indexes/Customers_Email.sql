IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_Customers_Email' AND object_id = OBJECT_ID('Customers'))
    DROP INDEX IX_Customers_Email ON Customers;
GO
-- Index for Customers Email
CREATE INDEX IX_Customers_Email ON Customers(Email);
GO
