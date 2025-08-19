# SQL Performance Demo

A demonstration project focused on SQL performance best practices, including indexing, query optimization, and schema design. The project uses a sample database and is organized for clarity and hands-on experimentation.

---

## Technology Stack
- Microsoft SQL Server (recommended)
- SQL (DDL, DML)
- No external dependencies or frameworks

---

## Project Architecture
- **Schema Files**: Located in `tables/`, each file defines a single table (e.g., `Customers.sql`).
- **Index Files**: Located in `indexes/`, each file defines a single index (e.g., `Orders_CustomerID.sql`).
- **Demo Script**: The root `demo_performance_db.sql` orchestrates schema creation, index application, and includes sample queries for performance testing.

```
project-root/
├── tables/           # Table definitions (DDL)
├── indexes/          # Index definitions
└── demo_performance_db.sql  # Main demo script
```

---

## Getting Started
1. **Prerequisites**: Microsoft SQL Server (or compatible), SQL Server Management Studio (SSMS) or Azure Data Studio.
2. **Setup**:
   - Run all scripts in `tables/` to create tables.
   - Run all scripts in `indexes/` to create indexes.
   - Execute `demo_performance_db.sql` for additional setup and demo queries.
3. **Performance Testing**:
   - Use queries in `demo_performance_db.sql` to compare performance with and without indexes.
   - Comment/uncomment index creation statements to observe impact.

---

## Project Structure
- `tables/` — Table DDL scripts
- `indexes/` — Index DDL scripts
- `demo_performance_db.sql` — Main orchestration and demo queries

---

## Key Features
- Modular table and index definitions for easy experimentation
- Demonstrates impact of indexing on query performance
- Simple, self-contained structure for learning and testing
- No external dependencies or application code

---

## Development Workflow
- Manual execution of scripts in SQL environment
- Focus on query plans and execution times for performance analysis
- No automated test suite; manual inspection is expected
- Use SSMS or Azure Data Studio for query analysis

---

## Coding Standards
- Table files named after the entity (e.g., `Customers.sql`)
- Index files named after table and column (e.g., `Orders_CustomerID.sql`)
- Strict separation of table and index definitions
- Standard SQL DDL and DML syntax

---

## Testing
- Manual performance testing using demo queries
- Use `SET STATISTICS TIME ON` or similar statements to measure query execution time
- No automated tests; rely on manual inspection and query plan analysis

---

## Contributing
- Contributions welcome for new performance patterns, schema designs, or demo queries
- Follow existing file naming and separation conventions
- See code examples in `tables/` and `indexes/` for guidance

---

## License
This project is provided for educational and demonstration purposes. No specific license is included.

---

## References
- [SQL Server Documentation](https://learn.microsoft.com/en-us/sql/)
- [SSMS Download](https://aka.ms/ssms)
- [Azure Data Studio](https://learn.microsoft.com/en-us/sql/azure-data-studio/)
