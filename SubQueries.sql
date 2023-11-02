--SubQueries: query inside query
 
SELECT BusinessEntityID,NationalIDNumber, JobTitle, HireDate
FROM HumanResources.Employee
WHERE BusinessEntityID IN
   (SELECT BusinessEntityID
     FROM HumanResources.EmployeeDepartmentHistory
   )
ORDER BY JobTitle;
 
SELECT BusinessEntityID,NationalIDNumber, JobTitle, HireDate
FROM HumanResources.Employee
WHERE BusinessEntityID IN
   (SELECT BusinessEntityID
     FROM HumanResources.EmployeeDepartmentHistory
	 WHERE BusinessEntityID <= 100
   )
ORDER BY JobTitle;

--

SELECT Min(UnitPrice)
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice IN
  (SELECT TOP 2 UnitPrice
   FROM Purchasing.PurchaseOrderDetail
   ORDER BY UnitPrice DESC
  );
 
SELECT Min(UnitPrice)
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice IN
  (SELECT TOP 3 UnitPrice
   FROM Purchasing.PurchaseOrderDetail
   ORDER BY UnitPrice DESC
  );
 
 -- get third biggest of the smallest price
SELECT Min(UnitPrice)
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice IN
  (SELECT TOP 3 UnitPrice
   FROM Purchasing.PurchaseOrderDetail
   GROUP BY UnitPrice
   ORDER BY UnitPrice DESC
  );
 
 
SELECT PurchaseOrderID, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice >
 (SELECT Avg(ListPrice)
  FROM Production.Product
 );
 
SELECT PurchaseOrderID, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE UnitPrice <
 (SELECT Avg(ListPrice)
  FROM Production.Product
 );

-- EXISTS() : check if particular record exists

 SELECT *
FROM HumanResources.Employee;
 
SELECT *
FROM HumanResources.Department;
 
SELECT BusinessEntityId, JobTitle 
FROM HumanResources.Employee
WHERE EXISTS
  (SELECT DepartmentID
   FROM HumanResources.Department
   WHERE Name = 'Sales'
  );
 
SELECT BusinessEntityId, JobTitle 
FROM HumanResources.Employee
WHERE EXISTS
  (SELECT DepartmentID
   FROM HumanResources.Department
   WHERE Name = 'Sales'
  ) AND JobTitle LIKE '%Sales%';

--

SELECT DISTINCT ProductSubCategoryID
FROM Production.Product
WHERE ProductSubCategoryID IN
 (SELECT ProductSubCategoryID
  FROM Production.ProductSubcategory
  WHERE ProductCategoryID IN
   (SELECT ProductCategoryID 
    FROM Production.ProductCategory
	WHERE Name LIKE '%Bikes%'
   )
  );

--

SELECT PurchaseOrderId, TaxAmt,
 (SELECT sum(OrderQty)
  FROM Purchasing.PurchaseOrderDetail AS pod
  WHERE pod.PurchaseOrderID = poh.PurchaseOrderID
  GROUP BY pod.PurchaseOrderID
 ) AS SumOrderQty
FROM Purchasing.PurchaseOrderHeader AS poh
ORDER BY poh.PurchaseOrderID;

--

SELECT avg(minUnitPrice) AS avgMinUnitPricePerOrder
FROM
 (SELECT PurchaseOrderID, min(UnitPrice) AS minUnitPrice
  FROM Purchasing.PurchaseOrderDetail
  GROUP BY PurchaseOrderID
 ) AS minUnitPricePerOrder;
 
SELECT avg(minUnitPrice) AS avgMinUnitPricePerOrder
FROM
 (SELECT min(UnitPrice) AS minUnitPrice
  FROM Purchasing.PurchaseOrderDetail
  GROUP BY PurchaseOrderID
 ) AS minUnitPricePerOrder;

--ANY : returns TRUE if any of value in subquery meets condition
--ALL : returns TRUE if all of value in subquery meets condition 

SELECT PurchaseOrderId, DueDate, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE DueDate >= 
 ANY (SELECT OrderDate
      FROM Purchasing.PurchaseOrderHeader);

--

SELECT PurchaseOrderId, DueDate, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE DueDate = 
 ANY (SELECT ORderDate
      FROM Purchasing.PurchaseOrderHeader);
 
SELECT PurchaseOrderId, DueDate, UnitPrice
FROM Purchasing.PurchaseOrderDetail
 
SELECT PurchaseOrderId, DueDate, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE DueDate = '2011-05-14 00:00:00.000';
 
SELECT PurchaseOrderId, OrderDate
FROM Purchasing.PurchaseOrderHeader
WHERE OrderDate = '2011-05-14 00:00:00.000';

--

SELECT PurchaseOrderId, DueDate, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE DueDate <> 
 ALL (SELECT ORderDate
      FROM Purchasing.PurchaseOrderHeader);
 
SELECT PurchaseOrderId, DueDate, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE DueDate = 
 ANY (SELECT ORderDate
      FROM Purchasing.PurchaseOrderHeader);
 
SELECT PurchaseOrderId, DueDate, UnitPrice
FROM Purchasing.PurchaseOrderDetail
WHERE DueDate >= 
 ANY (SELECT ORderDate
      FROM Purchasing.PurchaseOrderHeader);

	  -- 6820 + 2025 = 8845