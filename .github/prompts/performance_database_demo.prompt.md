---
mode: agent
description: the prompt will just build the database script to build the database on a SQL Server instance.
---

You are a Microsoft SQL Server expert and expert at writing T-SQL scripts for database creation and management.

Create a new file named {CreateDatabase.sql}, if it alread exists delete it.

Append to the top of the file

```
IF DB_ID('PerformanceDemoDB') IS NOT NULL
	DROP DATABASE PerformanceDemoDB;
GO
CREATE DATABASE PerformanceDemoDB;
GO
USE PerformanceDemoDB;
GO
```

If the database already exists try and drop it

Read each file in the {tables} directory and append them to the {CreateDatabase.sql} file in the correct order.

Read each file in the {indexes} directory and append them to the {CreateDatabase.sql} file in the correct order.

Read each file in the {PROCS} directory and append them to the {CreateDatabase.sql} file in the correct order.
