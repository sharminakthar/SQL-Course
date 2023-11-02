-- SELECT * FROM DatabaseName.SchemaName.TableName

-- select all
SELECT * 
FROM Person.Person; 

-- select specific columns
-- order you write columns is the order they appear
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person;

-- 'FirstName' in all columns
SELECT 'FirstName'
FROM Person.Person; 

-- gives all job titles from human resources
SELECT JobTitle
FROM HumanResources.Employee;

-- gives unique job titles, no duplicates
-- DISTINCT does not ignore NULL values
SELECT DISTINCT JobTitle
FROM HumanResources.Employee;

SELECT DISTINCT Title, Suffix
FROM Person.Person;

-- SELECT CASE
SELECT NationalIDNumber, HireDate, VacationHours,
CASE
WHEN VacationHours > 70 THEN 'Vacation hours over limit'
-- BETWEEN is inclusive
WHEN VacationHours BETWEEN 48 AND 70 THEN 'Vacation hours average'
ELSE 'Vacation hours within limit'
-- AS = ALIAS (temporary name)
END AS VacationHourLimit
FROM HumanResources.Employee;

