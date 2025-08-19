-- Inefficient: Returns all customers using a cursor
CREATE PROCEDURE GetAllCustomers_Inefficient
AS
BEGIN
    DECLARE @CustomerID INT, @Email NVARCHAR(255)
    DECLARE customer_cursor CURSOR FOR SELECT CustomerID, Email FROM Customers
    OPEN customer_cursor
    FETCH NEXT FROM customer_cursor INTO @CustomerID, @Email
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Do nothing, just iterate
        FETCH NEXT FROM customer_cursor INTO @CustomerID, @Email
    END
    CLOSE customer_cursor
    DEALLOCATE customer_cursor
    SELECT * FROM Customers -- Redundant full table scan
END
GO
