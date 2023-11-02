-- Joins
-- combines columns from multiple tables
-- SELECT col1, col2,..
-- FROM tableA, table B,...
-- WHERE condition
-- Implicit Join^ as not saying JOIN

SELECT Purchasing.PurchaseOrderDetail.PurchaseOrderID,
       Purchasing.PurchaseOrderDetail.PurchaseOrderDetailID,
	   Purchasing.PurchaseOrderDetail.OrderQty,
	   Purchasing.PurchaseOrderHeader.OrderDate,
	   Purchasing.PurchaseOrderHeader.ShipDate
FROM Purchasing.PurchaseOrderDetail, Purchasing.PurchaseOrderHeader
WHERE Purchasing.PurchaseOrderDetail.PurchaseOrderID 
      = 
	  Purchasing.PurchaseOrderHeader.PurchaseOrderID;
 
SELECT pod.PurchaseOrderID,
       pod.PurchaseOrderDetailID,
	   pod.OrderQty,
	   poh.OrderDate,
	   poh.ShipDate
	   -- replace ... with pod and poh
FROM Purchasing.PurchaseOrderDetail pod, Purchasing.PurchaseOrderHeader poh
WHERE pod.PurchaseOrderID 
      = 
	  poh.PurchaseOrderID;

-- INNER JOIN : returns only matching records from both tables
-- SELECT tA.col1, tA.col2, ..., tB.col1, tb.col2
-- FROM tableA tA
-- INNER JOIN
-- tableB tB
-- on tA.col1 = tB.col1;

SELECT pod.PurchaseOrderID,
       pod.PurchaseOrderDetailID,
	   pod.OrderQty,
	   poh.OrderDate,
	   poh.ShipDate
FROM Purchasing.PurchaseOrderDetail pod
    INNER JOIN
Purchasing.PurchaseOrderHeader poh
ON pod.PurchaseOrderID = poh.PurchaseOrderID;
 
SELECT pod.PurchaseOrderID,
       pod.PurchaseOrderDetailID,
	   pod.OrderQty,
	   poh.OrderDate,
	   poh.ShipDate
FROM Purchasing.PurchaseOrderDetail pod
    INNER JOIN
Purchasing.PurchaseOrderHeader poh
ON pod.PurchaseOrderID = poh.PurchaseOrderID
WHERE year(poh.OrderDate) = 2014;
--
SELECT p.ProductID, p.Name, pc.ProductCategoryID, pc.Name,
       psc.ProductSubCategoryID
FROM Production.Product P
  INNER JOIN
Production.ProductSubcategory psc
ON psc.ProductSubCategoryID = p.ProductSubCategoryID
  INNER JOIN
Production.ProductCategory pc
ON pc.ProductCategoryID = psc.ProductCategoryID;

-- LEFT JOIN : returns all records from left table and only matching records from right table
-- SELECT tA.col1, tA.col2, ..., tB.col1, tb.col2
-- FROM tableA tA
-- LEFT JOIN
-- tableB tB
-- on tA.col1 = tB.col1;

SELECT c.CustomerId, pcc.BusinessEntityID, c.StoreId, pcc.CreditCardId
FROM Sales.Customer c
  LEFT JOIN
Sales.PersonCreditCard pcc
ON c.CustomerId = pcc.BusinessEntityID;

SELECT c.CustomerId, pcc.BusinessEntityID, c.StoreId, pcc.CreditCardId
FROM Sales.Customer c
  LEFT OUTER JOIN
Sales.PersonCreditCard pcc
ON c.CustomerId = pcc.BusinessEntityID;

-- RIGHT JOIN
-- returns records from right table and only matching records from left 
-- SELECT tA.col1, tA.col2, ..., tB.col1, tb.col2
-- FROM tableA tA
-- RIGHT (OUTER) JOIN
-- tableB tB
-- on tA.col1 = tB.col1;
SELECT c.CustomerId, pcc.BusinessEntityID, c.StoreId, pcc.CreditCardId
FROM Sales.Customer c
  RIGHT JOIN
Sales.PersonCreditCard pcc
ON c.CustomerId = pcc.BusinessEntityID;
 
SELECT CustomerId, StoreId
FROM Sales.Customer
WHERE CustomerID IN (703, 705, 709);
 
SELECT c.CustomerId, pcc.BusinessEntityID, c.StoreId, pcc.CreditCardId
FROM Sales.PersonCreditCard pcc
  LEFT JOIN 
Sales.Customer c
ON c.CustomerId = pcc.BusinessEntityID;

--FULL JOIN : combination of LEFT and RIGHT join
-- SELECT tA.col1, tA.col2, ..., tB.col1, tb.col2
-- FROM tableA tA
-- FULL JOIN
-- tableB tB
-- on tA.col1 = tB.col1;
SELECT c.CustomerId, pcc.BusinessEntityID, c.StoreId, pcc.CreditCardId
FROM Sales.PersonCreditCard pcc
  FULL JOIN 
Sales.Customer c
ON c.CustomerId = pcc.BusinessEntityID;
 
SELECT c.CustomerId, pcc.BusinessEntityID, c.StoreId, pcc.CreditCardId
FROM Sales.PersonCreditCard pcc
  FULL OUTER JOIN 
Sales.Customer c
ON c.CustomerId = pcc.BusinessEntityID;

--CROSS JOIN : combines each record from one table with each record of another table
-- avoid using if possible 
SELECT count(*)
FROM HumanResources.Employee;
 
SELECT count(*)
FROM HumanResources.Department;
 
SELECT * FROM HumanResources.Employee, HumanResources.Department;
 
SELECT * FROM HumanResources.Employee CROSS JOIN HumanResources.Department;