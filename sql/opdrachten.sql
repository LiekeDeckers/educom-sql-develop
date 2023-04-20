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

--30. Firstname, Lastname can be reached at xExtension as ContactInfo
SELECT  CONCAT(FirstName, ' ', LastName, ' ', 'can be reached at', ' ', 'x', Extension) AS ContactInfo
FROM    employees;

--31. ContactName of all customers that do not have letter A as the second alphabet in their Contactname
SELECT  ContactName
FROM    customers
WHERE   ContactName NOT LIKE '_a%';

--32.  average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders 
-- from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
SELECT  ROUND(AVG(UnitPrice)) AS AveragePrice,
        SUM(UnitPrice * UnitsInStock) AS TotalPrice,
        MAX(UnitsOnOrder) AS MaxOrder
FROM    products;

--33. SupplierID, CompanyName, CategoryName, ProductName and UnitPrice 
--from the products, suppliers and categories table
SELECT  products.SupplierID,
        suppliers.CompanyName,
        categories.CategoryName,
        products.ProductName,
        products.UnitPrice
FROM    products
JOIN    suppliers ON products.SupplierID = suppliers.SupplierID 
JOIN    categories ON products.CategoryID = categories.CategoryID;

--34. CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID
SELECT  CustomerID,
        SUM(Freight) AS sumOfFreight
FROM    orders
GROUP BY CustomerID
HAVING  SUM(Freight) > 200;

--35. OrderID ContactName, UnitPrice, Quantity, Discount 
-- from the order details, orders and customers table with discount given on every purchase.
SELECT  orders.OrderID,
        customers.ContactName,
        order_details.UnitPrice,
        order_details.Quantity,
        order_details.Discount 
FROM    order_details
JOIN    orders ON orders.OrderID = order_details.OrderID
JOIN    customers ON customers.CustomerID = orders.CustomerID;

--36. EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName 
-- of who they report to as manager from the employees table sorted by Employee ID.
SELECT  A.EmployeeID,
        CONCAT(A.FirstName, ' ', A.LastName) AS employee,
        CONCAT(B.FirstName, ' ', B.LastName) AS manager
FROM    employees A
JOIn    employees B ON A.ReportsTo = B.EmployeeID 
ORDER BY EmployeeID;

--37. the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice
SELECT  AVG(UnitPrice) AS AveragePrice,
        MIN(UnitPrice) AS MinimumPrice,
        MAX(UnitPrice) AS MaximumPrice
FROM    products;

--38. a view that shows the CustomerID, CompanyName, ContactName, ContactTitle, 
-- Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table.
CREATE VIEW customer_orders AS
SELECT  customers.CustomerID,
        customers.CompanyName,
        customers.ContactName,
        customers.ContactTitle, 
        customers.Address, 
        customers.City,
        customers.Country,
        customers.Phone, 
        orders.OrderDate, 
        orders.RequiredDate,
        orders.ShippedDate
FROM    orders
JOIN    customers ON customers.CustomerID = orders.CustomerID;

--39. Change the name of the view you created to customer details
RENAME TABLE customer_orders
TO customer_details;

--40. a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, 
-- Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued 
-- from the supplier, products and categories tables
CREATE VIEW product_details AS
SELECT  products.ProductID,
        suppliers.CompanyName,
        products.ProductName,
        categories.CategoryName,
        categories.Description,
        products.QuantityPerUnit,
        products.UnitPrice,
        products.UnitsInStock,
        products.UnitsOnOrder,
        products.ReorderLevel,
        products.Discontinued
FROM    products
JOIN    categories ON categories.CategoryID = products.CategoryID
JOIN    suppliers ON suppliers.SupplierID = products.SupplierID;

--41. Drop the customer details view
DROP VIEW customer_details;

--42. fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
SELECT  LEFT(CategoryName, 5) AS ShortInfo
FROM    categories

--43. create a copy of the shipper table as shippers_duplicate. 
CREATE TABLE shippers_duplicate LIKE shippers;
--Then insert a copy of shippers data into the new table
INSERT INTO shippers_duplicate SELECT * FROM shippers;

--44. ShipperID, CompanyName, Phone, Email from the shippers_duplicate table
SELECT  ShipperID, 
        CompanyName, 
        Phone, 
        LOWER(CONCAT(REPLACE(CompanyName, ' ', ''), '@gmail.com')) AS Email 
FROM    shippers_duplicate;

--45. CompanyName and ProductName from all product in the Seafood category
SELECT  suppliers.CompanyName, 
        products.ProductName
FROM    products
JOIN    suppliers ON suppliers.SupplierID = products.SupplierID
JOIN    categories ON categories.CategoryID = products.CategoryID
WHERE   categories.CategoryName = 'Seafood';

--46. CategoryID, CompanyName and ProductName from all product in the categoryID 5.
SELECT  products.CategoryID, 
        suppliers.CompanyName, 
        products.ProductName
FROM    products
JOIN    categories ON categories.CategoryID = products.CategoryID
JOIN    suppliers ON suppliers.SupplierID = products.SupplierID
WHERE   products.CategoryID = 5;

--47. Delete the shippers_duplicate table
DROP TABLE shippers_duplicate;

--48. LastName, FirstName, Title, Age from the employees table
DECLARE @Now AS datetime
SELECT  @Now='2023-04-20'
        LastName, 
        FirstName,
        Title,
        (CONVERT(int,CONVERT(char(8),@Now,112))-CONVERT(char(8),BirthDate,112))/10000 AS Age
FROM    employees;