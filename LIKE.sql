-- Matching a pattern

-- LIKE operator in WHERE
-- % : To match 0 or more characters

SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE 'R%';
-- Job titles starting with letter R

SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager%';
-- Job titles with any characters 
-- or words before or after manager

-- LIKE with [...] operator in WHERE
-- [...]: To match a single character
-- [bc]at will match either bat or cat

SELECT *
FROM Person.StateProvince
--WHERE StateProvinceCode LIKE 'A[BKL]%'
--WHERE StateProvinceCode LIKE '[IL]A%';
WHERE StateProvinceCode LIKE '[MN][ABCDEFGHIJKLM]%';

-- LIKE with [start-end] operator in WHERE
-- [start-end] is also called as character range

SELECT * 
FROM Production.Product
WHERE ProductNumber LIKE 'L[IJKLMN]%';

-- can be rewritten as 

SELECT * 
FROM Production.Product
WHERE ProductNumber LIKE 'L[I-N]%';

--

SELECT * 
FROM Production.Product
WHERE ProductNumber LIKE 'L[A-Z]-[0-9]%';

SELECT * 
FROM Production.Product
WHERE ProductNumber LIKE 'L[I-N]-[135]%';


-- LIKE with Negation in WHERE

-- [^...] = Negation character
-- To match a character which is not present inside the square brackets
-- [^a-e] will match any letters apart from a,b,c,d,e 

SELECT *
FROM Production.Product
WHERE ProductNumber LIKE 'L[^I-N]-[^135]%';

-- LIKE with _  in WHERE
-- _ : To match a single character only
-- abc_ : will match abcd, abcde, abcf

SELECT *
FROM Person.StateProvince
--WHERE StateProvinceCode LIKE 'A[BKL]';
-- returns nothing as there is a space
-- in the data after state province codes
WHERE StateProvinceCode LIKE 'A[BKL]_';
-- returns AB, AK, AL

SELECT *
FROM Person.StateProvince
WHERE NAME LIKE 'AL_';
-- returns nothing as there is no Name with three characters

SELECT *
FROM Person.StateProvince
WHERE NAME LIKE 'AL____';
-- returns ALASKA and ALLIER 

SELECT PersonType
FROM Person.Person
WHERE PersonType LIKE 'S_'
-- returns SP and SC

-- want unique types:
SELECT DISTINCT PersonType
FROM Person.Person
WHERE PersonType NOT LIKE 'S_'

-- Escaping characters
SELECT *
FROM Purchasing.Vendor
WHERE NAME LIKE '%,%'

SELECT *
FROM Purchasing.Vendor
WHERE NAME LIKE '%.%'

-- Hill's Bicycle Service
SELECT *
FROM Purchasing.Vendor
WHERE NAME LIKE '%''%';
-- no space
