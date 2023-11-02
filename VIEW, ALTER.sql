-- SECTION 11

-- VIEWS
-- Virtual table is NOT a physical table
-- a. encapsulate Main table
-- b. do not store data permanently
-- c. code complex logic in view
-- d. access only required data
-- CREATE VIEW viewName as Query;

-- Dropping VIEWS
-- to permanently remove a view, you can use DROP VIEW command
-- DROP VIEW viewName;

-- Create or alter view
-- to create a view if it is not existing
-- alter a view if it is existing
-- CREATE OR ALTER VIEW ViewName AS Query;

-- SECTION 12
-- Copy Records from Other Table
-- SELECT INTO statement : create a new table from old table
-- SELECT * INTO NewTable FROM OldTable;

-- INSERT INTO with SELECT statement
-- to insert(copy) records in a table from another table
-- INSERT INTO Table1 SELECT * FROM Table 2 {WHERE Condition};
-- INSERT INTO Table1(c1,c2,...) SELECT c1,c2,... FROM Table 2 {WHERE Condition};

-- SECTION 14



-- Alter the properties

-- ALTER statement: change the structure of a table
	-- add a new column/s, constraints and keys
	-- delete an existing column/s, constraints and index
	-- change column/s, keys, constraints

-- ALTER ADD statement : add a new column, constraint or key
	-- ALTER TABLE tableName
	-- ADD {columnDetail | constraint Detail | keyDetail}

-- ALTER ADD for default value : 
	-- ALTER TABLE tableName
	-- ADD CONSTRAINT 
	-- DEFAULT .. FOR

	-- ALTER TABLE tableName
	-- ADD DEFAULT

-- ALTER Statement for modification: change existing columns datatype, length, etc
	-- ALTER TABLE tableName
	-- ALTER COLUMN {columnDetail | constraintDetail}

-- ALTER DROP statement : completely remove column or constraint
	-- ALTER TABLE tableName
	-- DROP COLUMN {columnDetail | constraintDetail}

-- RENAMING tables and columns : use SP_RENAME to rename a column or table
	-- For renaming column:
	-- SP RENAME 'OldColumnName', 'NewColumnName','COLUMN'

	-- For renaming Table:
	-- SP_RENAME 'OldColumnTable', 'NewColumnTable'

-- DELETE and DROP statement :
-- DELETE is used to delete records from table
-- DELETE FROM tableName WHERE condition

-- DROP is used to drop an object like table
-- DROP TABLE tableName

-- DROP index :
-- DROP INDEX IDX_CheckItems_ItemName ON CheckItems;