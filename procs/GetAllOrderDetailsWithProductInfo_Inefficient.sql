-- Inefficient: Returns all order details with unnecessary join and no filtering
CREATE PROCEDURE GetAllOrderDetailsWithProductInfo_Inefficient
AS
BEGIN
    SELECT od.*, p.*
    FROM OrderDetails od
    LEFT JOIN Products p ON od.ProductID = p.ProductID
END
GO
