-- Inefficient: Returns all employees with a self-join
CREATE PROCEDURE GetAllEmployeesWithSelfJoin_Inefficient
AS
BEGIN
    SELECT e1.*, e2.*
    FROM Employees e1
    LEFT JOIN Employees e2 ON e1.EmployeeID = e2.EmployeeID
END
GO
