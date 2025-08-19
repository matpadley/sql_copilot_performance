# Copilot Instructions for SQL Performance Demo

## Project Overview
This codebase is a SQL performance demonstration project. It is organized to showcase best practices for indexing, query optimization, and schema design using a sample database. The structure is intentionally simple to focus on performance patterns and their impact.

## Architecture & Data Flow
- **Schema Files**: All table definitions are in `tables/`. Each file (e.g., `Customers.sql`, `Orders.sql`) contains the DDL for a single table.
- **Index Files**: All index definitions are in `indexes/`. Each file (e.g., `Orders_CustomerID.sql`) contains the DDL for a specific index, named by table and indexed column.
- **Stored Procedures**: All stored procedures are in the `procs/` folder. Each file (e.g., `GetAllCustomers_Inefficient.sql`) contains a single stored procedure, named by its purpose and inefficiency pattern.
- **Demo Script**: The root `demo_performance_db.sql` is the main entry point. It orchestrates schema creation, index application, stored procedure creation, and may include sample queries for performance testing.

## Developer Workflow
- **Setup**: To initialize the demo, run all table scripts in `tables/` followed by all index scripts in `indexes/`. Then execute `demo_performance_db.sql` for any additional setup or demo queries.
- **Testing Performance**: Use the queries in `demo_performance_db.sql` to compare performance with and without indexes. You may comment/uncomment index creation statements to observe impact.
- **Debugging**: Focus on query plans and execution times. Use SQL Server Management Studio (SSMS) or Azure Data Studio for analysis. No automated test suite is present; manual inspection is expected.

## Project-Specific Conventions
- **File Naming**: Table files are named after the entity (`Customers.sql`), index files after the table and column (`Orders_CustomerID.sql`), and stored procedure files after the procedure name (`GetAllCustomers_Inefficient.sql`).
- **Separation of Concerns**: Table, index, and stored procedure definitions are strictly separated for clarity and modularity.
- **No External Dependencies**: The project is self-contained; no external libraries or integrations.
- **No Application Code**: This is a pure SQL project—no backend, frontend, or service layers.

## Key Patterns & Examples
- **Indexing**: Each index file contains a single `CREATE INDEX` statement. Example:
  ```sql
  -- indexes/Orders_CustomerID.sql
  CREATE INDEX IX_Orders_CustomerID ON Orders (CustomerID);
  ```
- **Schema Definition**: Table files use standard DDL. Example:
  ```sql
  -- tables/Orders.sql
  CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATETIME
  );
  ```
- **Stored Procedures**: Each stored procedure file contains a single inefficient procedure. Example:
  ```sql
  -- procs/GetAllCustomers_Inefficient.sql
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
  ```
- **Performance Demo**: The main script may include timing or `SET STATISTICS TIME ON` statements to measure query performance.

## Integration Points
- **Manual Execution**: All scripts are intended for manual execution in a SQL environment. No automation or CI/CD is configured.

## References
- **Key Directories**: `tables/` (schema), `indexes/` (indexes), `procs/` (stored procedures), root SQL script (demo orchestration)
- **Example Workflow**:
  1. Run all `tables/*.sql` scripts
  2. Run all `indexes/*.sql` scripts
  3. Run all `procs/*.sql` scripts
  4. Run `demo_performance_db.sql` for demo queries

---

If any section is unclear or missing important project-specific details, please provide feedback so this guide can be improved.
