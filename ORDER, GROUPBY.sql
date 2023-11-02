-- ORDER BY clause
-- ORDER BY columnName ASC/DESC
-- ASV = default order

SELECT JobCandidateId, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate;

-- FROM -> WHERE -> SELECT -> ORDERBY

SELECT TOP 3 JobCandidateId, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC;

SELECT CONCAT(AddressLine1, ' ' , AddressLine2, ' ' , City, ' ' ,
				StateProvinceID, ' ' , PostalCode)
		AS PostalAddress
FROM Person.Address
ORDER BY AddressID

SELECT ProductID, Name, StandardCost, ListPrice
FROM Production.Product
WHERE StandardCost>0 AND ListPrice>0
ORDER BY StandardCost ASC, ListPrice DESC;

SELECT ProductID, Name, StandardCost, ListPrice
FROM Production.Product
WHERE StandardCost>0 AND ListPrice>0
-- ORDER BY NUMBER means order by number mentioned in clause
ORDER BY 3; 
-- Means order by third mentioned : standard cost

SELECT BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY BirthDate DESC;
--LEN() to extract length

SELECT AddressID, AddressLine1, LEN(AddressLine1) AS LengthAdd1
FROM Person.Address
ORDER BY LEN(AddressLine1) ASC;

SELECT BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate ASC;


SELECT BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate ASC
--skips the first 5 rows
OFFSET 5 ROWS
--returns only 20 rows
FETCH NEXT 20 ROWS ONLY;

-- top five rows by hiredate:

SELECT BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate DESC
--skips the 0 rows
OFFSET 0 ROWS
--returns only 5 rows
FETCH NEXT 5 ROWS ONLY;

-- equivalent to

SELECT TOP 5 BusinessEntityID, NationalIDNumber, HireDate
FROM HumanResources.Employee
ORDER BY HireDate DESC;

-- SELECT TOP 2 JobCandidateID, ModifiedDate
SELECT TOP 2 JobCandidateID, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC
OFFSET 0 ROWS
FETCH NEXT 2 ROWS ONLY;

SELECT TOP 2 ProductID, Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;

SELECT TOP 2 WITH TIES ProductID, Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;

SELECT TOP 10 PERCENT SalesOrderID, SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;

SELECT TOP 1 *
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;

-- GROUP BY Clause
-- To group records per category

SELECT SalesOrderID, OrderQty
FROM Sales.SalesOrderDetail;

SELECT SalesOrderID, SUM(OrderQty)
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;

SELECT GroupName, COUNT(GroupName)
FROM HumanResources.Department
GROUP BY GroupName;
--equivalent
SELECT GroupName, COUNT(*)
FROM HumanResources.Department
GROUP BY GroupName;

SELECT PayFrequency, SUM(Rate) AS TotalRatePerPayFrequency
FROM HumanResources.EmployeePayHistory
GROUP BY PayFrequency
ORDER BY PayFrequency DESC;

SELECT ProductID, Shelf, SUM(Quantity) AS SumPerProductPerShelf
FROM Production.ProductInventory
GROUP BY ProductID, Shelf
ORDER BY Shelf DESC;