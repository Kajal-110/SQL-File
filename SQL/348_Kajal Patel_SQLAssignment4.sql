use KP348KajalPatel;


CREATE TABLE Employee_Info(EmployeeID int primary key,
							LastName varchar(250) not null,
							FirstName varchar(250) not null,
							Title varchar (250),
							BirthDate date,
							HireDate date,
							ReportsTo int,
							Address varchar(250));


insert into Employee_Info(EmployeeID ,LastName ,FirstName ,Title ,BirthDate ,HireDate,ReportsTo ,Address)
						values(101, 'Patel','Kajal','HR','2000-01-01','2023-01-01',111,'Jabalpur'),
						  (102,' Dattani','Pooja','SDE','2001-11-02', '2023-02-06',113,'Okha'),
						  (103, 'Patel','Shivani','HR','2000-01-01','2023-01-01',111,'Jabalpur'),
						  (104,' Khare','Ram','SDE','2004-11-02', '2023-02-06',113,'Katni'),
						  (105, 'Gupta','Ashi','Finance','2006-01-01','2023-01-01',114,'Sihora'),
						  (106,' Vishawkarma','Shiva','SDE','1999-11-07', '2023-02-06',114,'Bhopal'),
						  (107, 'Varma','Kajal','QA','2003-01-01','2023-01-01',112,'Rewa'),
						  (108,' Parmar','Bansi','Management','2006-11-15', '2023-02-06',113,'Stna'),
						  (109, 'Patel','Vidhi','HR','2002-01-17','2023-01-01',112,'Nagpur'),
						  (110,' Bilwar','Anjali','SDE','1998-11-02', '2023-02-06',115,'Gwaliar');
					
					

CREATE TABLE Order_Info(OrderID int primary key,
CustomerID int
FOREIGN KEY (CustomerID) REFERENCES Customers_Info(CustomerID),
EmployeeID int
FOREIGN KEY (EmployeeID) REFERENCES Employee_Info(EmployeeID),
OrderDate date);

INSERT INTO Order_Info(OrderID,CustomerID,EmployeeID,OrderDate)
				VALUES(1001,01,101, '2022-12-31'),
				      (1002,02,102, '2022-12-11'),
					  (1003,03,102, '2022-02-23'),
					  (1013,04,104, '2021-09-23'),
				      (1005,05,105, '2020-08-21'),
					  (1006,06,106, '2019-07-18'),
					  (1007,07,106, '2021-10-13'),
				      (1008,08,107, '2020-06-11'),
					  (1009,09,108, '2019-05-09'),
					  (1010,10,109, '2020-04-07'),
				      (1011,02,110, '2019-03-05'),
					  (1012,03,109, '2018-02-03');
				
				
INSERT INTO Order_Info(OrderID,CustomerID,EmployeeID)
				VALUES(1004,01,101);

CREATE TABLE Customers_Info(CustomerID int primary key,
CompanyName varchar(250) not null,
ContactName varchar(250) not null,
ContactTitle varchar(250) not null,
Address varchar(250) not null,
City varchar(250) not null,
Country varchar(250) not null);

insert into Customers_Info(CustomerID,CompanyName,ContactName,ContactTitle,Address,City,Country)
					values(01,'TCS','Simran','Manager','little wings','Ahemdabad', 'India'),
					(02,'Shaligram Infotech','Bhumika','HR','Jayantilal park','Ahemdabad', 'India'),
					(03,'Accenture','Rajesh','Manager','Malainium business park','Mumbai', 'India'),
					(04,'Capgemini','Manisha','Manager','Bhopal Gam','Pune', 'Tirane'),
					(05,'HCL','Mihir','HR','Bhavy Park','Ahemdabad', 'Afghanistan'),
					(06,'Wipro','Vikrant','QA','Samrpan banglow','Mumbai', 'China'),
					(07,'Hexaware','Deepak','Database Analysist','Amli','Pune', 'Brazil'),
					(08,'Ocwen','Harsh','HR','little wings','Ahemdabad', 'Indonesia'),
					(09,'Mastek','Vishal','QA','Swagat Banglow','Pune', 'USA'),
					(10,'Google','Vikash','Manager','Jayantilal park','Mumbai', 'Brazil');
					
					


UPDATE Customers_Info  SET Country='USA' where CustomerID=1;

SELECT * FROM Employee_Info;
SELECT * FROM Order_Info;
SELECT * FROM Customers_Info;

--Write a SQL query to retrieve the list of all orders made by customers in the "USA".
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c inner join 
Order_Info o on c.CustomerID=o.CustomerID
where Country='USA';

--Write a SQL query to retrieve the list of all customers who have placed an order.

select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c inner join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null;

--Write a SQL query to retrieve the list of all employees who have not yet placed an order.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate
from Employee_Info e inner join Order_Info o on  e.EmployeeID=o.EmployeeID
where OrderDate is null;

--Write a SQL query to retrieve the list of all employees who have placed an order.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate
from Employee_Info e inner join Order_Info o on  e.EmployeeID=o.EmployeeID
where OrderDate is not null;

--Write a SQL query to retrieve the list of all customers who have not yet placed an order.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is null;

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the order date.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,o.OrderDate 
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null;

--Write a SQL query to retrieve the list of all orders placed by a particular customer.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c right join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null and c.CustomerID=5;

--Write a SQL query to retrieve the list of all orders placed by a particular employee.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate
from Employee_Info  e inner join Order_Info o on  e.EmployeeID=o.EmployeeID
where OrderDate is not  null and e.EmployeeID=101;

--Write a SQL query to retrieve the list of all orders placed by a particular customer on a particular date.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c right join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null and c.CustomerID=3 and o.OrderDate='2022-02-23';

--Write a SQL query to retrieve the list of all customers who have not yet placed an order, sorted by their country.
select c.CustomerID,c.CompanyName,c.ContactName,o.OrderDate ,c.Country
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is  null
order by Country;

--Write a SQL query to retrieve the list of all orders placed by customers in the "USA", sorted by order date.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c right join 
Order_Info o on c.CustomerID=o.CustomerID
where  OrderDate is not  null and Country='USA'
order by OrderDate;

--Write a SQL query to retrieve the list of all employees who have not yet placed an order, sorted by last name.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate
from Employee_Info e left join Order_Info o on  e.EmployeeID=o.EmployeeID
where OrderDate is null
order by LastName;

--Write a SQL query to retrieve the list of all customers who have placed an order, sorted by their company name.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null
order by CompanyName;

--Write a SQL query to retrieve the list of all employees who have placed an order, sorted by their hire date.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate
from Employee_Info e left join Order_Info o on  e.EmployeeID=o.EmployeeID
where OrderDate is not null
order by HireDate;

--Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, sorted by their company name.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate ,c.Country
from Customers_Info c inner join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null and OrderDate='2022-12-31'
order by CompanyName;

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the employee who handled the order.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate,o.EmployeeID ,c.Country
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null ;

--Write a SQL query to retrieve the list of all employees who have placed an order, along with the customer who placed the order.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate,o.CustomerID
from Employee_Info e left join Order_Info o on  e.EmployeeID=o.EmployeeID
where OrderDate is not null;

--Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the customer name and order date.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate,o.EmployeeID ,c.Country
from Customers_Info c right join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null  and Country='Brazil';


--Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular year,
--along with the employee name and order date.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate,o.CustomerID
from Employee_Info e right join Order_Info o on  e.EmployeeID=o.EmployeeID
where  OrderDate is not  null  and  year(BirthDate)=1999;

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, 
--order date, and employee who handled the order.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate,o.EmployeeID ,c.Country
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null  ;

--Write a SQL query to retrieve the list of all orders placed by customers who have a particular contact title, along with 
--the customer name and order date.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate,o.EmployeeID ,c.Country
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null and ContactTitle='Manager' ;

--Write a SQL query to retrieve the list of all orders placed by employees who have a particular job title, along with the 
--employee name and order date.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,e.Address,o.OrderDate,o.CustomerID
from Employee_Info e LEFT join Order_Info o on  e.EmployeeID=o.EmployeeID
where  OrderDate is not  null  and Title='HR';

--Write a SQL query to retrieve the list of all customers who have placed an order on a particular date, along with the customer name, 
--order date, and employee who handled the order.
select c.CustomerID,c.CompanyName,c.ContactName,c.ContactTitle,c.Address,c.City,o.OrderDate,o.EmployeeID ,c.Country
from Customers_Info c left join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null and OrderDate='2022-12-11' ;

--Write a SQL query to retrieve the list of all orders placed by customers in a particular city, along with the customer name and order date.
select c.CustomerID,c.CompanyName,c.City,o.OrderDate,c.Country
from Customers_Info c inner join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null and City='Ahemdabad' ;

--Write a SQL query to retrieve the list of all orders placed by employees who were born in a particular city, 
--along with the employee name and order date.
select e.EmployeeID ,e.LastName ,e.FirstName ,e.Title ,e.BirthDate ,e.HireDate,e.ReportsTo ,
e.Address,o.OrderDate,o.CustomerID,c.City
from ((Employee_Info e inner join Order_Info o on  e.EmployeeID=o.EmployeeID)
inner join Customers_Info c on  c.CustomerID= o.CustomerID)
where  OrderDate is not  null AND City='Mumbai' ;

--Write a SQL query to retrieve the list of all customers who have placed an order, along with the customer name, order date,
--and employee who handled the order, sorted by order date.
select c.CustomerID,c.CompanyName,c.ContactName,c.City,o.OrderDate, o.EmployeeID,c.Country
from Customers_Info c LEFT join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null  
order by OrderDate ;

--Write a SQL query to retrieve the list of all orders placed by customers in a particular country, along with the 
--customer name and order date, sorted by order date.
select c.CustomerID,c.CompanyName,c.ContactName,c.City,o.OrderDate, o.EmployeeID,c.Country
from Customers_Info c RIGHT join 
Order_Info o on c.CustomerID=o.CustomerID
where OrderDate is not  null AND Country='USA' 
order by OrderDate ;


