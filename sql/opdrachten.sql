--1. CategoryName and Description from the categories table sorted by CategoryName
SELECT  CategoryName, 
        Description 
FROM    categories 
ORDER BY CategoryName;

--2. ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone
SELECT  ContactName, 
        CompanyName, 
        ContactTitle,
        Phone
FROM    customers
ORDER BY Phone;

--3. capitalized FirstName and LastName renamed as FirstName and LastName, and HireDate from the employees table
-- sorted from newest to oldest employee
SELECT  UPPER(FirstName) AS FirstName,
        UPPER(LastName) AS LastName,
        HireDate
FROM    employees
ORDER BY HireDate DESC;

--4. top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table 
-- sorted by Freight in descending order
SELECT  OrderID, 
        OrderDate,
        ShippedDate,
        CustomerID,
        Freight
FROM    orders
ORDER BY Freight DESC
LIMIT   10;

--5. all the CustomerID in lowercase letter and renamed as ID from the customers table
SELECT  LOWER(CustomerID) AS ID
FROM    customers;

--6. CompanyName, Fax, Phone, Country, HomePage from the suppliers table 
-- sorted by the Country in descending order then by CompanyName in ascending order
SELECT  CompanyName,
        Fax,
        Phone,
        Country,
        HomePage
FROM    suppliers
ORDER BY Country DESC, CompanyName ASC;

--7. CompanyName, ContactName of all customers from ‘Buenos Aires' only
SELECT  CompanyName,
        ContactName
FROM    customers
WHERE   city = 'Buenos Aires';

--8. ProductName, UnitPrice, QuantityPerUnit of products that are out of stock
SELECT  ProductName,
        UnitPrice,
        QuantityPerUnit
FROM    products
WHERE   UnitsInStock = 0;

--9. all the ContactName, Address, City of all customers not from Germany, Mexico, Spain
SELECT  ContactName,
        Address,
        City 
FROM    customers
WHERE   country != 'GERMANY' AND country != 'Mexico' AND country != 'Spain';

--10. OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996
SELECT  OrderDate, 
        ShippedDate, 
        CustomerID,
        Freight
FROM    orders
WHERE   OrderDate = '1996-05-21';

--11. FirstName, LastName, Country from the employees not from United States
SELECT  FirstName, 
        LastName,
        Country
FROM    employees
WHERE   country != 'USA';

--12. EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from 
-- all orders shipped later than the required date
SELECT  EmployeeID,
        OrderID,
        CustomerID,
        RequiredDate,
        ShippedDate
FROM    orders
WHERE   ShippedDate > RequiredDate;

--13. City, CompanyName, ContactName of customers from cities starting with A or B.
SELECT  City,
        CompanyName,
        ContactName
FROM    customers
WHERE   city LIKE 'A%' OR city LIKE 'B%';

--14. all the even numbers of OrderID from the orders table
SELECT  OrderID
FROM    orders
WHERE   mod(OrderID,2) = 0;

--15. all the orders where the freight cost more than $500
SELECT  *
FROM    orders
WHERE   freight > 500;

--16. ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder
SELECT  ProductName, 
        UnitsInStock, 
        UnitsOnOrder,
        ReorderLevel
FROM    products
WHERE   UnitsOnOrder > 0;

--17. CompanyName, ContactName number of all customer that have no fax number
SELECT  CompanyName,
        ContactName,
        Phone
FROM    customers
WHERE   ISNULL(Fax);

--18. FirstName, LastName of all employees that do not report to anybody
SELECT  FirstName,
        LastName
FROM    employees
WHERE   ISNULL(ReportsTo);

--19. all the odd numbers of OrderID from the orders table
SELECT  OrderID
FROM    orders
WHERE   mod(OrderID,2) <> 0;

--20. CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName
SELECT  CompanyName,
        ContactName,
        Fax
FROM    customers
WHERE   ISNULL(Fax)
ORDER BY ContactName ASC;

--21. City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName
SELECT  City,
        CompanyName,
        ContactName
FROM    customers
WHERE   city LIKE '%l%'
ORDER BY ContactName ASC;

--22. FirstName, LastName, BirthDate of employees born in the 1950s
SELECT  FirstName,
        LastName,
        BirthDate
FROM    employees
WHERE   BirthDate BETWEEN '1950-01-01' AND '1959-12-31';

--23. FirstName, LastName, the year of Birthdate as birth year from the employees table
SELECT  FirstName,
        LastName,
        YEAR(BirthDate) AS BirthYear
FROM    employees;

--24. OrderID, total number of Order ID as NumberofOrders from the orderdetails table 
-- grouped by OrderID and sorted by NumberofOrders in descending order.
SELECT  OrderID,
        COUNT(OrderID) AS NumberofOrders
FROM    order_details
GROUP BY OrderID; 

--25. SupplierID, ProductName, CompanyName from all products 
-- Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
SELECT  products.SupplierID,
        products.ProductName,
        suppliers.CompanyName 
FROM    products
JOIN    suppliers ON suppliers.SupplierID = products.SupplierID
WHERE   CompanyName = 'Exotic Liquids' OR CompanyName = 'Specialty Biscuits, Ltd.' OR CompanyName = 'Escargots Nouvoux'
ORDER BY SupplierID;

--26. ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders 
-- with ShipPostalCode beginning with "98124"
SELECT  ShipPostalCode,
        OrderID,
        OrderDate,
        RequiredDate,
        ShippedDate,
        ShipAddress
FROM    orders
WHERE   ShipPostalCode LIKE '98124%';

--27. ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle
SELECT  ContactName,
        ContactTitle,
        CompanyName
FROM    customers
WHERE   contactTitle NOT LIKE '%sales%';

--28. LastName, FirstName, City of employees in cities other "Seattle"
SELECT  LastName,
        FirstName,
        City
FROM    employees
WHERE   city != 'Seattle';

--29. CompanyName, ContactTitle, City, Country of all customers 
-- in any city in Mexico or other cities in Spain other than Madrid.
SELECT  CompanyName,
        ContactTitle,
        City,
        Country
FROM    customers
WHERE   country = 'Mexico' OR country = 'Spain' AND city != 'Madrid';

--30. Firstname, Lastname can be reached at x Extension as ContactInfo
SELECT  FirstName,
        LastName,
        Extension
FROM    employees;









