IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_Customers_City' AND object_id = OBJECT_ID('Customers'))
    DROP INDEX IX_Customers_City ON Customers;
GO
CREATE INDEX IX_Customers_City ON Customers (City);
GO