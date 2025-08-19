-- Inefficient: Returns all products with a scalar subquery for category
CREATE PROCEDURE GetAllProductsWithCategory_Inefficient
AS
BEGIN
    SELECT p.*, (SELECT TOP 1 Category FROM Products WHERE ProductID = p.ProductID) AS ProductCategory
    FROM Products p
END
GO
