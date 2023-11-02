-- Unions and Intersections

-- UNION : Combines multiple SELECT statements and removes duplicates
-- SELECT col1, col2, ... FROM tableA WHERE condition
-- UNION
-- SELECT col1, col2, ... FROM tableB WHERE condition

-- UNION ALL : Combines multiple SELECT statements, does not remove duplicates
-- SELECT col1, col2, ... FROM tableA WHERE condition
-- UNION ALL
-- SELECT col1, col2, ... FROM tableB WHERE condition

-- All SELECT statements which take part should have same number of columns
-- All columns in each SELECT statement have compatible data types

-- UNION/ UNION ALL : combines rows from multiple tables

SELECT PurchaseOrderId
FROM Purchasing.PurchaseOrderDetail
   UNION
SELECT PurchaseOrderID
FROM Purchasing.PurchaseOrderHeader;
 
SELECT PurchaseOrderDetailID
FROM Purchasing.PurchaseOrderDetail
   UNION
SELECT TaxAmt
FROM Purchasing.PurchaseOrderHeader
ORDER BY PurchaseOrderDetailID ASC;
 
SELECT TaxAmt
FROM Purchasing.PurchaseOrderHeader
ORDER BY TaxAmt

--

SELECT BusinessEntityID
FROM HumanResources.Employee
    UNION
SELECT BusinessEntityID
FROM Person.Person
    UNION
SELECT BusinessEntityID
FROM Purchasing.ProductVendor
    UNION
SELECT CustomerId
FROM Sales.Customer
    UNION
SELECT BusinessEntityID
FROM Sales.SalesPerson;
 
SELECT NationalIDNumber
FROM HumanResources.Employee
   UNION
SELECT FirstName
FROM Person.Person;

--The query which is just below will not work because of incompatible data types
SELECT BusinessEntityID
FROM HumanResources.Employee
   UNION
SELECT FirstName
FROM Person.Person;
 
--The below query will not work because of ORDER BY clause
SELECT FirstName + MiddleName + LastName AS FullName
FROM Person.Person
   UNION
SELECT Name
FROM Purchasing.Vendor
ORDER BY FullName, Name;

--INTERSECT : combines distinct rows from multiple tables that are common

SELECT ProductSubCategoryID
FROM Production.Product
  INTERSECT
SELECT ProductSubCategoryID
FROM Production.ProductSubcategory;

--EXCEPT : compares records from multiple tables that
--returns only distinct rows from 1st query that are not present in other remaining queries

SELECT SalesOrderID
FROM Sales.SalesOrderDetail
   EXCEPT
SELECT CustomerID
FROM Sales.Customer;