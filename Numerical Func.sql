--Numerical Functions 

--SUM() : sum of numbers
--AVG() : average of (all non null) numbers
--MAX() : max value
--MIN() : min value
--COUNT() : count values
--Default = ALL

SELECT SUM(ALL StandardCost)
FROM Production.Product;

-- SUM (DISTINCT) calculates sum of distinct values only
SELECT SUM(DISTINCT StandardCost)
FROM Production.Product;

--AVG
SELECT MAKEFLAG, AVG(ALL StandardCost) AS AvgStdCost
FROM Production.Product
GROUP BY MakeFlag;

SELECT MAKEFLAG, AVG(DISTINCT StandardCost) AS AvgStdCost
FROM Production.Product
GROUP BY MakeFlag;

--COUNT
SELECT COUNT(color)
FROM Production.Product
WHERE color IS NOT NULL;

SELECT MAKEFLAG, COUNT(StandardCost) AS CountStdCost
FROM Production.Product
GROUP BY MakeFlag;

SELECT MAKEFLAG, COUNT(DISTINCT StandardCost) AS CountStdCost
FROM Production.Product
GROUP BY MakeFlag;

--MAX AND MIN
SELECT MakeFlag, MAX(StandardCost) AS MaxStdCost
FROM Production.Product
GROUP By MakeFlag
ORDER BY MAX(StandardCost);

SELECT MIN(StandardCost) AS MinStdCost
FROM Production.Product
WHERE StandardCost>0;

--Less used functions
--ABS: Absolute value
SELECT ABS($12345.55)

--CEILING: Nearest integer value more than or equal to
SELECT StandardCost, CEILING(StandardCost)
FROM Production.Product
WHERE StandardCost>0;

--FLOOR: Nearest integer value less than or equal to
SELECT StandardCost, FLOOR(StandardCost)
FROM Production.Product
WHERE StandardCost>0;

--RAND() : random number greater than or equal to 0 and less than 1
--RAND() : random number greater than or equal to 0 and less than 100
--RAND()*(b-a)+a : random real number between a and b

-- Random value greater than or equal to N
-- RAND() + N
SELECT RAND() + 3 ;

-- want random integer greater than or equal to 3
-- less than or equal to 8
SELECT CEILING( RAND()*5 + 3 );

--ROUND(N, number of places)
SELECT ROUND(345.6789,2);

-- String Functions

--CHARINDEX() : will return position of substring from a specific position
--CHARINDEX(subStr, mainstring, startposition)

SELECT CHARINDEX('D', 'DAD');
--returns '1' 

SELECT CHARINDEX('D', 'DAD', 2);
-- returns '3' as it starts from 2nd position A

SELECT Name
FROM Production.Product
 
SELECT Name, CHARINDEX('Cr', Name)
FROM Production.Product;
 
SELECT Name, CHARINDEX('Cr', Name)
FROM Production.Product
WHERE Name LIKE '%Cr%';

-- CONCAT() : combine 2 or more strings into a single 
-- CONCAT_WS() : combine 2 or more strings into a single using a separator
-- DATALENGTH() : returns number of bytes used including leading and trailing spaces
-- FORMAT() : formats input string to a particular format

SELECT FirstName, DATALENGTH(FirstName) AS NumberOfBytes
FROM Person.Person
GROUP BY FirstName;

SELECT FORMAT(20200616, '####-##-##');
SELECT FORMAT(20200616, '####/##/##');

--LEFT() : select fixed number of characters from left
--RIGHT() : select fixed number of characters from right
--LEN() : length of string

SELECT FirstName, LEFT(FirstName,2) AS ExtractNameFromLeft
FROM Person.Person;

SELECT FirstName, RIGHT(FirstName,2) AS ExtractNameFromRight
FROM Person.Person;

SELECT FirstName, LEN(FirstName) AS ExtractLengthOfName
FROM Person.Person;

--LOWER() : convert string to lowercase
--UPPER() : convert string to uppercase
--LTRIM() : removes leading whitespaces (blanks before input string)
--RTRIM() : removes trailing whitespaces (blanks after input string)
--TRIM() : removes leading and trailing spaces

SELECT FirstName, LOWER(FirstName) AS LowerFName
FROM Person.Person;
 
SELECT FirstName, UPPER(FirstName) AS LowerFName
FROM Person.Person;
 
SELECT LTRIM('		   Trim Left Side');
 
SELECT RTRIM('Trim Right Side		 ');
 
SELECT TRIM('  Trim Both The Sides   ');

--PATINDEX() : displays position of first occurence of pattern in input string
--REPLACE() : replaces all occurences of a substring by another substring inside the main string
--REPLICATE() : repeats a string a particular number of times

SELECT Name, PATINDEX('%Ball%',Name)
FROM Production.Product
WHERE Name LIKE '%Ball%';
 
SELECT Name, Patindex('%Cr_nk%',Name)
FROM Production.Product
WHERE Name LIKE '%Cr%';
 
SELECT LoginID, REPLACE(LoginID,'adventure-works','aw') AS ReplaceString
FROM HumanResources.Employee;
 
 --REPLICATE(String, NumberOfCount)
SELECT FirstName, REPLICATE(FirstName,3) AS ReplicateFName
FROM Person.Person;

--REVERSE(): reverses string while displaying result
--STR(): return a number as a string 
--SUBSTRING() : extracts substring from main string

SELECT FirstName, REVERSE(FirstName) AS ReverseFName
FROM Person.Person;
 
--SUBSTRING(MainString, StartingPosition, Length);

SELECT Top 100 LastName, Substring(LastName,3,5) AS SubstringLName
FROM Person.Person
ORDER BY LastName;
 
SELECT ProductID, STR(ProductID) AS StringProductID
FROM Production.Product;

--DateAdd() : adds date or time to another date
--DateAdd(format-interval, number, dateVal)

--DateDiff() : returns difference between two dates
--DateDiff(datePart, date1, date2)

--year,y,yyyy,yy
--quater, q, qq
--month, m, mm
--day, d, dd
--hour, hh
--minute, mi, n
--second, ss, s
--millisecond, ms

SELECT ProductID, SellStartDate,dateadd(yyyy,3,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,dateadd(q,3,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,dateadd(m,3,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,dateadd(d,3,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,dateadd(hh,3,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,dateadd(n,50,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,dateadd(s,10,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,SellEndDate, dateadd(ms,50,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,SellEndDate, dateadd(m,50,sellstartdate) AS NewSellStartDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,SellEndDate, datediff(yyyy,sellstartdate,sellenddate) AS diffDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,SellEndDate, datediff(q,sellstartdate,sellenddate) AS diffDate
FROM Production.Product;
 
SELECT ProductID, SellStartDate,SellEndDate, datediff(q,sellstartdate,sellenddate) AS diffDate
FROM Production.Product
WHERE SellEndDate IS NOT NULL;

--DatePart() : returns part of date as integer
--DatePart(date-interval, dateField)

--Day() : extracts day from date
--day([date field])

--Month() : extracts month from date
--month([date field])

--Year() : extracts year from date
--year([date field])

SELECT ProductID, SellStartDate,datepart(month,sellstartdate) AS Extractmonth
FROM Production.Product;
 
SELECT ProductID, SellStartDate,day(sellstartdate) AS ExtractDay
FROM Production.Product;
 
SELECT ProductID, SellStartDate,month(sellstartdate) AS ExtractMonth
FROM Production.Product;
 
SELECT ProductID, SellStartDate,year(sellstartdate) AS ExtractYear
FROM Production.Product;

--Datename() : returns part of date as string
--Datename(date-interval, dateField)

--Eomonth() : returns last date of month from specific date

SELECT ProductID, SellStartDate,datename(month,sellstartdate) AS Extractmonth
FROM Production.Product;
 
SELECT ProductID, SellStartDate,eomonth(sellstartdate) AS EndOfMonth
FROM Production.Product;

--CURRENT_TIMESTAMP : returns current system date with time (without time zone)
--GETDATE() : returns current systems date with time from server
--SYSDATETIME() : returns current systems date with time from server (more precision)--SYSDATETIMEOFFSET();
--SYSDATETIMEOFFSET() :  returns current system date with time (with time zone)

SELECT CURRENT_TIMESTAMP;
SELECT GETDATE();
SELECT sysdatetime();
SELECT SYSDATETIMEOFFSET();

-- isDate() : returns boolean value of 1 if expression is valid date/time/datetime
-- isNull() : check whether expression is NULL value or not
-- isNumeric() : check whether expression is Numeric value or not

SELECT SellStartDate, isdate(SellStartDate)
FROM Production.Product;
 
SELECT isdate(1) As booleanValue;
-- returns 0
SELECT isnull(NULL,'Abc'); 
-- returns Abc
SELECT isnull('123','Abc');
-- returns 123 
SELECT isnull(NULL,0);
-- returns 0
SELECT isnull(0,5);
-- returns 0
SELECT isnull(' ',5); 
-- returns blank
SELECT Color, isnull(Color,'hello') as CheckforNull
FROM Production.Product;
-- returns colour or hello if 'null' 
SELECT StandardCost, isnumeric(StandardCost) AS testNumeric
FROM Production.Product;
 
SELECT Color, isnumeric(Color) AS testNumeric
FROM Production.Product;

--COALESCE() : returns first non-NULL value from list
-- COALESCE(val1, val2, ... , valn)

SELECT coalesce(NULL,NULL,'Welcome',NULL,'SQL');
-- returns Welcome
SELECT coalesce(NULL,NULL,NULL,NULL,'SQL');
-- returns SQL
SELECT Title, MiddleName, coalesce(title,middlename)
FROM Person.Person;
 
--NULLIF() : returns Null if both expressions equal
-- NULLIF(expression1, expression2) 
SELECT NULLIF(14,12);
-- returns 14
SELECT NULLIF(10,10);
-- returns NULL

--CONVERT(): converts to another data type
--convert(todatatype, expression)

SELECT StandardCost, convert(nvarchar(20),StandardCost) AS convertedType
FROM Production.Product;
 
--IIF() : takes 3 arguments, tests first, if true, displays 2nd argument, else displays 3rd

SELECT ProductId,StandardCost, ListPrice, 
 iif(ListPrice>=StandardCost,'Profit','Loss') AS testCondition
FROM Production.Product
WHERE Listprice < StandardCost;
 
SELECT ProductId,StandardCost, ListPrice, 
 iif(ListPrice>=StandardCost,'Profit','Loss') AS testCondition
FROM Production.Product;
--WHERE Listprice < StandardCost;
 
SELECT ProductId,StandardCost, ListPrice, 
 iif(ListPrice<StandardCost,'Profit','Loss') AS testCondition
FROM Production.Product;
--WHERE Listprice < StandardCost;

--HAVING : filter records of aggregate function/records where GROUP BY clause is used

SELECT max(StandardCost)
FROM Production.Product
HAVING max(standardCost) > 200;
 
SELECT DueDate,Sum(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) > 2011 AND Month(DueDate) < 9
GROUP BY DueDate
ORDER BY DueDate DESC;
 
SELECT DueDate,Sum(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) > 2011 AND Month(DueDate) < 9 
GROUP BY DueDate
 
 
SELECT DueDate,Sum(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
--WHERE YEAR(DueDate) > 2011 AND Month(DueDate) < 9 
GROUP BY DueDate
HAVING sum(OrderQty) < 6000
ORDER BY DueDate DESC;

-- SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER