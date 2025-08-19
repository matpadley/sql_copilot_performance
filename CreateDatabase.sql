IF DB_ID('PerformanceDemoDB') IS NOT NULL
	DROP DATABASE PerformanceDemoDB;
GO
CREATE DATABASE PerformanceDemoDB;
GO
USE PerformanceDemoDB;
GO
-- Customers table
CREATE TABLE Customers (
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Email NVARCHAR(100),
	City NVARCHAR(50),
	Country NVARCHAR(50),
	CreatedDate DATETIME DEFAULT GETDATE()
);

-- Employees table
CREATE TABLE Employees (
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	FirstName NVARCHAR(50),
	LastName NVARCHAR(50),
	Title NVARCHAR(50),
	HireDate DATETIME
);

-- Orders table
CREATE TABLE Orders (
	OrderID INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
	EmployeeID INT FOREIGN KEY REFERENCES Employees(EmployeeID),
	OrderDate DATETIME,
	ShipCity NVARCHAR(50),
	ShipCountry NVARCHAR(50)
);

-- Products table
CREATE TABLE Products (
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductName NVARCHAR(100),
	Category NVARCHAR(50),
	Price DECIMAL(10,2),
	Stock INT
);

CREATE TABLE OrderDetails (
	OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
	OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
	ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
	Quantity INT,
	UnitPrice DECIMAL(10,2)
);

-- Indexes
IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_Customers_City' AND object_id = OBJECT_ID('Customers'))
	DROP INDEX IX_Customers_City ON Customers;
GO
CREATE INDEX IX_Customers_City ON Customers (City);

IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_Customers_Country' AND object_id = OBJECT_ID('Customers'))
	DROP INDEX IX_Customers_Country ON Customers;
GO
CREATE INDEX IX_Customers_Country ON Customers (Country);

IF EXISTS (SELECT name FROM sys.indexes WHERE name = 'IX_Customers_Email' AND object_id = OBJECT_ID('Customers'))
	DROP INDEX IX_Customers_Email ON Customers;
GO
CREATE INDEX IX_Customers_Email ON Customers(Email);

IF EXISTS (
	SELECT name FROM sys.indexes 
	WHERE name = 'IX_OrderDetails_OrderID' 
	AND object_id = OBJECT_ID('OrderDetails')
)
	DROP INDEX IX_OrderDetails_OrderID ON OrderDetails;
GO
CREATE INDEX IX_OrderDetails_OrderID ON OrderDetails(OrderID);

IF EXISTS (
	SELECT name FROM sys.indexes 
	WHERE name = 'IX_Orders_CustomerID' 
	AND object_id = OBJECT_ID('Orders')
)
	DROP INDEX IX_Orders_EmployeeID ON Orders;
GO
CREATE INDEX IX_Orders_CustomerID ON Orders(CustomerID);

IF EXISTS (
	SELECT name FROM sys.indexes 
	WHERE name = 'IX_Orders_EmployeeID' 
	AND object_id = OBJECT_ID('Orders')
)
	DROP INDEX IX_Orders_EmployeeID ON Orders;
GO
CREATE INDEX IX_Orders_EmployeeID ON Orders(EmployeeID);

IF EXISTS (
	SELECT name FROM sys.indexes 
	WHERE name = 'IX_Products_Category' 
	AND object_id = OBJECT_ID('Orders')
)
	DROP INDEX IX_Orders_EmployeeID ON Orders;
GO
CREATE INDEX IX_Products_Category ON Products(Category);

-- Stored Procedures
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

-- Inefficient: Returns all employees with a self-join
CREATE PROCEDURE GetAllEmployeesWithSelfJoin_Inefficient
AS
BEGIN
	SELECT e1.*, e2.*
	FROM Employees e1
	LEFT JOIN Employees e2 ON e1.EmployeeID = e2.EmployeeID
END
GO

-- Inefficient: Returns all order details with unnecessary join and no filtering
CREATE PROCEDURE GetAllOrderDetailsWithProductInfo_Inefficient
AS
BEGIN
	SELECT od.*, p.*
	FROM OrderDetails od
	LEFT JOIN Products p ON od.ProductID = p.ProductID
END
GO

-- Inefficient: Returns all orders with a correlated subquery for employee name
CREATE PROCEDURE GetAllOrdersWithEmployeeName_Inefficient
AS
BEGIN
	SELECT o.*, 
		(
			SELECT TOP 1 
				CONCAT(e.FirstName, ' ', e.LastName) 
			FROM Employees e 
			WHERE e.EmployeeID = o.EmployeeID
		) AS EmployeeName
	FROM Orders o
END
GO

-- Inefficient: Returns all products with a scalar subquery for category
CREATE PROCEDURE GetAllProductsWithCategory_Inefficient
AS
BEGIN
	SELECT p.*, (SELECT TOP 1 Category FROM Products WHERE ProductID = p.ProductID) AS ProductCategory
	FROM Products p
END
GO
