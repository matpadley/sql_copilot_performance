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
