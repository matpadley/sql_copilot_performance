
DECLARE @i INT = 1;
WHILE @i <= 10000
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email, City, Country)
    VALUES ('First'+CAST(@i AS NVARCHAR), 'Last'+CAST(@i AS NVARCHAR), 'user'+CAST(@i AS NVARCHAR)+'@demo.com', 'City'+CAST(@i%100 AS NVARCHAR), 'Country'+CAST(@i%50 AS NVARCHAR));
    SET @i = @i + 1;
END
GO

SET @i = 1;
WHILE @i <= 100
BEGIN
    INSERT INTO Employees (FirstName, LastName, Title, HireDate)
    VALUES ('Emp'+CAST(@i AS NVARCHAR), 'Surname'+CAST(@i AS NVARCHAR), 'Sales'+CAST(@i%5 AS NVARCHAR), DATEADD(DAY, -@i, GETDATE()));
    SET @i = @i + 1;
END
GO

SET @i = 1;
WHILE @i <= 500
BEGIN
    INSERT INTO Products (ProductName, Category, Price, Stock)
    VALUES ('Product'+CAST(@i AS NVARCHAR), 'Category'+CAST(@i%10 AS NVARCHAR), RAND()*100+1, 1000-@i);
    SET @i = @i + 1;
END
GO

SET @i = 1;
WHILE @i <= 20000
BEGIN
    INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, ShipCity, ShipCountry)
    VALUES (ABS(CHECKSUM(NEWID())) % 10000 + 1, ABS(CHECKSUM(NEWID())) % 100 + 1, DATEADD(DAY, -@i, GETDATE()), 'City'+CAST(@i%100 AS NVARCHAR), 'Country'+CAST(@i%50 AS NVARCHAR));
    SET @i = @i + 1;
END
GO

SET @i = 1;
WHILE @i <= 50000
BEGIN
    INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice)
    VALUES (ABS(CHECKSUM(NEWID())) % 20000 + 1, ABS(CHECKSUM(NEWID())) % 500 + 1, ABS(CHECKSUM(NEWID())) % 10 + 1, RAND()*100+1);
    SET @i = @i + 1;
END
GO

