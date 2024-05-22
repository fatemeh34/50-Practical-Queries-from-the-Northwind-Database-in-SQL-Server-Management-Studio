----# Answers to 50 Questions of the Northwind Dataset #
--This notebook contains answers to 50 different questions based on the Northwind dataset. Each question is followed by the corresponding SQL query and its result.

--1-Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select CategoryName,Description from Categories
order by CategoryName
--2-Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
select  ContactName, Country,City from Customers
order by Country
select * from Employees
select EmployeeID,UPPER(LastName)as firstname,lower (FirstName) as firstname, BirthDate from Employees
where EmployeeID in (2,5,10,12)
order by BirthDate desc
select FirstName,EmployeeID  from Employees
where BirthDate between 1955-03-04 and 1928-09-19
select * from Customers
where Country = 'Germany'
--3-Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sorted by Freight in descending order.
select top 10 OrderID, OrderDate, OrderDate, CustomerID from Orders
order by OrderID desc
select * from orders 
--4-Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select LOWER(CustomerID ) as ID from Customers
--5-Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
select ContactName,Address,City,Country from Suppliers
order by  Country desc ,City  
--6-Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select UnitPrice,ProductName,QuantityPerUnit from Products
where UnitsInStock= 0
--7-Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select  ContactName,Address,City,Country from Customers
where Country not in ('Germany','Mexico','spain')
--8-Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
SELECT OrderDate, CustomerID, ShippedDate, Freight 
FROM Orders
WHERE OrderDate ='1996-05-21 00:00:00.000'
--9-Create a report showing FirstName, LastName, Country from the employees not from United States.
select FirstName,LastName,Country from Employees
where  Country  not in ('USA')
--10-Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date.
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate  from Orders
where ShippedDate> RequiredDate
--11-Create a report that shows the City, CompanyName, ContactName of customers from Contactname starting with A or B.
select City, CompanyName, ContactName  from Customers
where   ContactName like 'A%' or  ContactName like 'B%'
--12-Create a report showing all the even numbers of OrderID from the orders table.
SELECT *  from Orders
where OrderID%2=0
--15-Create a report that shows all the orders where the freight cost more than $500.
select * from Orders 
where Freight>=500
select CASE WHEN   Freight <500 then 'cheap '
 when Freight  < 800 then  'mid'-- then freihgt*.1
 when Freight<1000 then 'high'  --when feight between 10 and 20 then  freight*2
 else 'Na'
 end FrightTag

, * from Orders
order by FrightTag
select  Concat(FirstName,'ssss',LastName) from Employees
--16-Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder.
select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel from Products
where  ReorderLevel=0
---17-Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
select  CompanyName, ContactName ,Phone From Customers
where Fax is Null
--18-Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select FirstName, LastName  from Employees
where ReportsTo is Null
--19-Create a report showing all the odd numbers of OrderID from the orders table.
select * from orders 
where OrderID %2 !=0
--20-Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
 select  CompanyName, ContactName, Fax from Customers
 where Fax is Null 
 order by  ContactName
 --21-Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName.
 select City, CompanyName, ContactName from Customers
 where City Like '%L%' 
 order by ContactName
 -- 22-Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
  select FirstName, LastName, BirthDate from  employees
  where BirthDate>='1960-01-01 00:00:00.000' and BirthDate<  '1961-01-01 00:00:00.000'
--23-Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
 select FirstName, LastName,YEAR(BirthDate) as BirthYear from Employees
 select* from Employees
--24-Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order. HINT: you will need to use a Groupby statement.
select  OrderID ,COUNT(OrderID) as  NumberofOrders from [Order Details]
group by OrderID
order by NumberofOrders desc

--25-Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
SELECT s.SupplierID, p.ProductName, s.CompanyName 
FROM Suppliers s
left  JOIN Products p ON s.SupplierID = p.SupplierID
WHERE s.CompanyName IN ('Exotic Liquids', 'Specialty Biscuits', 'Ltd.', 'Escargots Nouveaux')
ORDER BY s.SupplierID;
SELECT * FROM Products
select * from Suppliers

--26-Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124"
select   ShippedDate,OrderID,OrderDate,RequiredDate,ShippedDate,ShipAddress ,ShipPostalCode from Orders
where ShipPostalCode Like '98124%'
 --Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
 select ContactName, ContactTitle, CompanyName from  Customers
 where ContactTitle not like '%Sales%'
 --27-Create a report that shows the LastName, FirstName, City of employees in cities other than "Seattle";
 select  LastName, FirstName, City from Employees
 where  City !='Seattle'
 select * from Customers
 --28-Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
 select CompanyName, ContactTitle, City, Country from Customers
 where  Country  in ('Mexico','Spain') and  City != 'Madrid'

 
 --29-Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
 select   ContactName   from Customers
 where ContactName not like  '_A%'
 --30-Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
 select  round( avg (UnitPrice),0) as  Avrageprice  ,sum (UnitsInStock*UnitPrice) as total , max (UnitsOnOrder) as maxorder from Products
 select * from Products
 --31-Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.
 select S.SupplierID, CompanyName, CategoryName, ProductName ,UnitPrice from products as P
 LEFT JOIN  Categories  as C ON  P.CategoryID=C.CategoryID
 left join  Suppliers as S on P.SupplierID= S.SupplierID
 --32-Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement.
 select  CustomerID, sum (Freight) as TotalFreight from Orders
 group  by   CustomerID
 having  sum ( Freight) >200
 select * from Orders
 --33-Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase.
 select * from Customers
 select*  from [Order Details]
 select  O.OrderID ,C. ContactName, UnitPrice, Quantity, Discount from Customers as C 
 left join  Orders as O on  O.CustomerID= C.CustomerID
 Left join [Order Details] as OD  on OD.OrderID= O.OrderID
 --34-Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee
select e.EmployeeID,e.FirstName,e.LastName,e.Title  from  Employees as e 
left join Employees as y on e.EmployeeID= y.EmployeeID
order by EmployeeID
--35-Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively.
select avg(UnitPrice ) as AvgeUnitPrice  ,max (UnitPrice) as MaxUnitPrice, min (UnitPrice )as MinUnitPrice  from Products

-- 36-Maximum UnitPrice and corresponding Product
SELECT ProductID,ProductName,UnitPrice AS MaxUnitPrice FROM Products
WHERE 
    UnitPrice = (SELECT MAX(UnitPrice) FROM Products);

--37- Minimum UnitPrice and corresponding Product
SELECT ProductID,ProductName,UnitPrice AS MinUnitPrice FROM Products
WHERE 
    UnitPrice = (SELECT min(UnitPrice) FROM Products);
--38-Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table.
create view  CuStomerinfo as
select C.CustomerID,C. CompanyName, C.ContactName,C. ContactTitle,C.Address  , C.City, C.Country, C.Phone,O.OrderDate, O.RequiredDate, O.ShippedDate from Customers as C
left join  Orders as O on O.CustomerID=C.CustomerID 
--39-Change the name of the view you created from customerinfo to customer details.
EXEC sp_rename 'CuStomerinfo', 'CutomerDetailes';
--40\\Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName,
--Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued
--from the supplier, products and categories tables\\
create view  ProductDetailes as 
select ProductID, S.CompanyName, P.ProductName, C.CategoryName,
C.Description, P.QuantityPerUnit, P.UnitPrice, P.UnitsInStock, P.UnitsOnOrder, P.ReorderLevel, P.Discontinued from Products as P 
left join  Suppliers as S  on S.SupplierID=P.SupplierID
 left join    Categories as C  on  C.CategoryID=P.CategoryID
 --41-Drop the customer details view.
 drop  view ProductDetailes
--42- Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
select  top 4  left (CategoryName ,5 )  from Categories as ShortInfo
--43-Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement.

SELECT * INTO shippers_duplicate FROM shippers;
select * from Shippers
--44-clear innformation when shipperId=3  in  shippers_duplicate table 
delete from  shippers_duplicate 
where ShipperID=3
select * from shippers_duplicate
-- 45-change the informations CompanyName as canada Express AND Phone number as (505)555-9831 in shippers_duplicate table  where ShipperID=1
update  shippers_duplicate
set CompanyName='canada Express' ,Phone='(505)555-9831'
where ShipperID=1
--46-Create a report that shows the CompanyName and ProductName from all product in the Seafood category.
select p.ProductName ,c.CategoryName from Products as p
left join  Categories as C on C.CategoryID=p.CategoryID
where C.CategoryName='Seafood' 
--47-Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select  P. CategoryID, S.CompanyName ,P. ProductName from Products as p
left join  Suppliers as S  on  p.SupplierID= s.SupplierID
where  p.CategoryID=5
--48-Delete the shippers_duplicate table.
drop table  shippers_duplicate
--a report that shows the firstName,Laste name , age from employee
select   FirstName,LastName,Title, DATEDIFF( year ,BirthDate, GETDATE()) as age   from Employees
--49-Create a report that the CompanyName and total number of orders by customer renamed as number of orders since December 31, 1994. Show number of Orders greater than 10.
SELECT C.CompanyName, COUNT(O.OrderID) AS NumberOfOrders FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE 
    O.OrderDate > '1994-12-31'
GROUP BY 
    C.CompanyName
HAVING 
    COUNT(O.OrderID) > 10
ORDER BY 
    NumberOfOrders DESC;
-- 50-Create a report that shows product information this way: Carnarvon Tigers weigh 16 kg per package and cost $62.50."
SELECT ProductName + ' weight is ' + QuantityPerUnit + ' and cost ' + CAST(UnitPrice AS varchar) + '$' AS ProductInfo
FROM Products;