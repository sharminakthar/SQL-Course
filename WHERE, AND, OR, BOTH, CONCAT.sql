-- Filtering records

-- SQL works in this order:
-- FROM -> WHERE -> SELECT

-- WHERE Clause
SELECT BusinessEntityID, NationalIDNumber, BirthDate--, MaritalStatus
FROM HumanResources.Employee
--WHERE MaritalStatus = 'S';
-- Birthdates are written in the form 'Year-Month-Day'
--WHERE BirthDate > '1985-01-20';
-- to extract specific years:
WHERE year(BirthDate) > 1985;

-- Comparison Operators in WHERE

-- Equal to : =
-- NOT equal to: <> or ! 
-- Greater or Less than: < or > 
-- Greater/less than or equal to: <= or >=

SELECT StateProvinceCode, CountryRegionCode
FROM Person.StateProvince
WHERE CountryRegionCode != 'US';

-- Arithmetic Operators in WHERE

-- Sum: +
-- Subtract: - 
-- Multiply: *
-- Divide: /

SELECT StandardCost, ListPrice, StandardCost + ListPrice AS SumListPriceCost
FROM Production.Product
WHERE StandardCost > 0;

-- Divison will not be successful if there is a null / zero value
SELECT ProductID, Name, ReorderPoint, StandardCost
FROM Production.Product
WHERE ReorderPoint/StandardCost  > 3 AND StandardCost <> 0;

-- Logical Operators in WHERE

-- AND: Returns value if all conditions true
-- OR: Returns calue is any one condition true
-- NOT: Returns calue if conditions not true

-- BOTH and
SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE ProductID < 600 AND StandardCost > 50;

-- EITHER or
SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE ProductID < 600 OR StandardCost > 50;

-- NEITHER not
SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE NOT ProductID = 4;

-- can be done with name records
SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE NOT Name = 'Adjustable Race';

-- Concatenation operator with WHERE
-- To combine strings: +
-- To add a space between: + ' ' + 

SELECT Title, FirstName, MiddleName, LastName,
	   Title  + ' ' + FirstName  + ' ' + MiddleName  + ' ' + LastName AS FullName
-- Null value combined with anything = Null output
FROM Person.Person
-- adding WHERE:
WHERE Title  + ' ' + FirstName  + ' ' + MiddleName  + ' ' + LastName = 
	'Ms. Gail A Erickson';

-- concat() function
-- if you want to concatenate multiple strings

SELECT Title, FirstName, MiddleName, LastName,
		CONCAT(Title, ' ' , FirstName, ' ' ,MiddleName, ' ' , LastName)
		AS FullName
	FROM Person.Person;

SELECT FirstName, BusinessEntityID, 
	CONCAT(FirstName, BusinessEntityID, '@', (CONCAT_WS('.', 'adventure-works','com'))) AS PersonEmail,
	CONCAT_WS('.', 'adventure-works','com') AS domain
FROM Person.Person;

-- NULL value in WHERE
-- IS NULL: missing known value
-- IS MOT NULL: does not have missing value

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color is NULL;

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color is NOT NULL;

-- BETWEEN operator in WHERE
-- To select matching values 
within range: BETWEEN 
-- To select matching values NOT within range: NOT BETWEEN 

SELECT ProductID, Name, Color
FROM Production.Product
--WHERE ProductID >= 1 AND ProductID <= 500;
WHERE ProductID BETWEEN 1 AND 500;

SELECT PurchaseOrderID, ModifiedDate
FROM Purchasing.PurchaseOrderDetail--;
-- hour:minute:second:milisecond
-- 00:00:00.000
WHERE ModifiedDate BETWEEN '2014-02-02' AND '2015-08-12';
-- 2014-02-03
-- 2015-05-07

SELECT BusinessEntityID, CAST(BirthDate AS datetime) AS BirthDateTime 
FROM HumanResources.Employee;

SELECT CAST('2020-06-12' AS datetime);

SELECT PurchaseOrderID, ModifiedDate
FROM Purchasing.PurchaseOrderDetail
WHERE ModifiedDate BETWEEN '2014-02-03' AND '2015-08-13';

--Tackling dates with CAST Function
SELECT PurchaseOrderID, ModifiedDate
FROM Purchasing.PurchaseOrderDetail
WHERE ModifiedDate BETWEEN '2014-02-03' AND '2015-08-13';

SELECT CAST(1.234 AS INT);

SELECT PurchaseOrderID, ModifiedDate
FROM Purchasing.PurchaseOrderDetail
WHERE CAST(ModifiedDate AS DATE) BETWEEN '2014-02-03' AND '2015-08-13';

-- IN operator in WHERE
-- IN: Select matching values within a fixed set of values
-- NOT IN: Select matching values NOT within a fixed set of values

SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE ProductID = 1 OR ProductID =10
OR ProductID = 15 OR ProductID = 20;

-- can be rewritten in a better way 

SELECT ProductID, Name, StandardCost, ListPrice, SafetyStockLevel
FROM Production.Product
WHERE ProductID IN (1,10,15,20);

SELECT *
FROM Person.StateProvince
WHERE StateProvinceCode IN ('AK', 'AZ', 'CO', 'ID', 'IA');

