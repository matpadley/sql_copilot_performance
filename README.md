# SQL Performance Demo

## Project Description
This repository demonstrates SQL performance optimization techniques using a sample database. It showcases best practices for indexing, query optimization, and schema design. The project is intentionally simple and self-contained, focusing on the impact of performance patterns in SQL Server environments.

## Technology Stack
- **Database:** Microsoft SQL Server (tested on SQL Server 2019+)
- **Languages:** T-SQL
- **Tools:** SQL Server Management Studio (SSMS), Azure Data Studio
- **Scripts:** PowerShell for orchestration

## Project Architecture
The project is organized into modular folders:
- **tables/**: Contains DDL scripts for each table
- **indexes/**: Contains DDL scripts for each index
- **procs/**: Contains inefficient stored procedures for demo purposes
- **support_scripts/**: Utility scripts for gathering table and index statistics
- **demo_performance_db.sql**: Main orchestration script for demo setup and performance testing

**Data Flow:**
1. Tables are created from scripts in `tables/`
2. Indexes are applied from scripts in `indexes/`
3. Stored procedures are created from scripts in `procs/`
4. Demo script runs sample queries and performance tests

## Getting Started
### Prerequisites
- Microsoft SQL Server (local or cloud instance)
- SSMS or Azure Data Studio

### Installation & Setup
1. Clone the repository:
   ```powershell
   git clone https://github.com/matpadley/sql_copilot_performance.git
   ```
2. Open SSMS or Azure Data Studio and connect to your SQL Server instance.
3. Run all scripts in `tables/` to create tables.
4. Run all scripts in `indexes/` to create indexes.
5. Run all scripts in `procs/` to create stored procedures.
6. Execute `demo_performance_db.sql` for demo orchestration and performance testing.

## Project Structure
```
Copilot-PerformancePrompt.md
CreateDatabase.sql
indexes/
    Customers_City.sql
    ...
procs/
    GetAllCustomers_Inefficient.sql
    ...
support_scripts/
    GetIndexStatistics.sql
    GetTableStatistics.sql
tables/
    Customers.sql
    ...
demo_performance_db.sql
RunAllDemoScripts.ps1
RunTableAndIndexStats.ps1
```
- **tables/**: Table definitions
- **indexes/**: Index definitions
- **procs/**: Inefficient stored procedures for demo
- **support_scripts/**: Utility scripts for statistics
- **demo_performance_db.sql**: Main demo orchestration script

## SQL Query Optimization Prompt

A reusable prompt for optimizing SQL queries is provided at `.github/prompts/optimise_sql_query.prompt.md`. This prompt is designed for use with Copilot or other LLMs to assist in improving SQL query performance. It works by:

- Requesting a query from the user (either inline or as a file).
- Reviewing available indexes in the `indexes/` folder.
- Considering table and index statistics from `database_performance/TableStatistics.csv` and `database_performance/IndexStatistics.csv`.
- Making targeted performance suggestions for T-SQL queries or stored procedures.

To use, provide a query or procedure file and reference the prompt for optimization advice.

## Key Features
- Modular SQL scripts for tables, indexes, and procedures
- Demonstrates inefficient query patterns and their optimization
- Includes scripts for gathering table and index statistics
- Easy to run and modify for performance testing

## Development Workflow
- Manual execution of scripts in recommended order
- Use SSMS/Azure Data Studio for query analysis and performance measurement
- Comment/uncomment index scripts to observe performance impact
- No automated CI/CD; manual workflow for demonstration purposes

## Coding Standards
- Each SQL file contains a single DDL or procedure
- File naming: `Entity.sql` for tables, `Table_Column.sql` for indexes, `ProcedureName_Inefficient.sql` for procs
- Separation of concerns: Tables, indexes, and procedures are strictly separated
- No external dependencies or application code

## Testing
- Manual performance testing using SSMS/Azure Data Studio
- Use `SET STATISTICS TIME ON` and query plans to analyze performance
- Utility scripts in `support_scripts/` for statistics gathering

## Contributing
- Fork the repository and create a feature branch
- Follow file naming and organization conventions
- Submit pull requests with clear descriptions
- Reference inefficient patterns and optimization strategies in your contributions

## License
This project is released under the MIT License.
