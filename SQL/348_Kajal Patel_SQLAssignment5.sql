use KP348KajalPatel;

create table emp_details(EMP_IDNO int unique not null  , 
						 EMP_FNAME varchar(250) not null, 
						 EMP_LNAME   varchar(250)  not null,
						 EMP_DEPT int 
						 foreign key( EMP_DEPT) references emp_department(DPT_CODE));

insert into emp_details(EMP_IDNO, EMP_FNAME ,EMP_LNAME ,EMP_DEPT)
				values(127323 ,'Michale',' Robbin', 57),
					  (526689 ,'Carlos',' Snares ',63),
					  (843795, 'Enric','Dosio',57),
					  (328717 ,'Jhon','Snares',63),
					  (444527 ,'Joseph','Dosni',47),
					  (659831,'Zanifer','Emily',47),
					  (847674,' Kuleswar','Sitaraman',57),
					  (748681 ,'Henrey',' Gabriel',47),
				      (555935,'Alex',' Manuel',57),
				      (539569,'George','Mardy',27),
				      (733843,'Mario','Saule',63),
				      (631548,'Alan','Snappy', 27),
				      (839139 ,'Maria','Foster ',57);

select * from emp_details;

create table emp_department(DPT_CODE int  primary key,
							DPT_NAME varchar(250),
							DPT_ALLOTMENT int)

insert into emp_department(DPT_CODE, DPT_NAME , DPT_ALLOTMENT)
					values( 57,' IT',65000),
						  (63,' Finance', 150000),
						  (47,'HR',240000),
						  (27,'RD',55000),
						  (89,'QC',75000);


update emp_department set DPT_ALLOTMENT=15000 where DPT_CODE=63;
select * from emp_department;

create table company_mast(COM_ID  int primary key,COM_NAME varchar(250));

insert into company_mast(COM_ID,COM_NAME)
					  values( 11,'Samsung'),
							(12,' iBall'),
							(13 ,'Epsion'),
							(14,' Zebronics'),
							(15, 'Asus'),
							(16 ,'Frontech');


select * from company_mast;

create table item_mast(PRO_ID int,
					   PRO_NAME varchar(250),
					   PRO_PRICE  decimal(5,1),
					   PRO_COM int
					   foreign key(PRO_COM) references company_mast(COM_ID));

insert into item_mast(PRO_ID, PRO_NAME,PRO_PRICE,PRO_COM)
				  values(101,' Mother Board ',3200, 15),
						(102, 'Key Board',450,16),
						(103, 'ZIP drive',250 ,14),
						(104 ,'Speaker',550,16),
						(105 ,'Monitor',5000 ,11),
						(106 ,'DVD drive',900,12),
						(107 ,'CD drive',800,12),
						(108 ,'Printer',2600,13),
						(109 ,'Refill cartridge',350,13),
						(110 ,'Mouse',250,12);

--drop table item_mast;

select * from item_mast;

create table salesman(salesman_id int primary key,
					 name varchar(250),
					 city varchar(250),
					 commission  float);

insert into salesman(salesman_id,name,city,commission )
		  values(  5001 ,' James Hoog',' New York',0.15),
				(5002,'Nail Knite','Paris ',0.13),
				(5005,'Pit Alex ','London ', 0.11),
				(5006 ,'Mc Lyon ','Paris ',0.14),
				(5007 ,'Paul Adam','Rome',0.13),
				(5003 ,'Lauson Hen','San Jose',0.12);

				update salesman set city= 'New York'
				where salesman_id=5001;

select * from salesman;

create table customer(customer_id int primary key,
					  cust_name varchar(250) not null,
					  city varchar(250) not null,
					  grade int ,
					  salesman_id  int 
					  foreign key(salesman_id) references salesman(salesman_id));

insert into customer(customer_id,cust_name,city, grade,salesman_id)
				values( 3002,'Nick Rimando','New York',100,5001),
        (3007,'Brad Davis', 'New York',200,5001),
        (3005,'Graham Zusi' ,'California',200,5002),
        (3008,'Julian Green', 'London', 300,5002),
        (3004,'Fabian Johnson','Paris',300 ,5006),
        (3009,'Geoff Cameron','Berlin',100,5003),
        (3003,'Jozy Altidor',' Moscow',200,5007);
insert into customer(customer_id,cust_name,city,salesman_id)values(3001,'Brad Guzan','London',5005);

select * from customer;

create table orders(ord_no int unique not null,
					purch_amt decimal(8,2),
					ord_date  date,
					customer_id  int 
					foreign key(customer_id) references customer(customer_id),
					salesman_id int
					foreign key(salesman_id) references salesman(salesman_id));



insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)
			values(70001 ,150.5, '2012-10-05',3005,5002),
					(70009,270.65,' 2012-09-10',3001,5005),
					(70002, 65.26,'2012-10-05',3002,5001),
					(70004,110.5,'2012-08-17',3009 ,5003),
					(70007,948.5,'2012-09-10',3005,5002),
					(70005,2400.6,'2012-07-27',3007,5001),
					(70008,5760,'2012-09-10',3002,5001),
					(70010,1983.43,'2012-10-10',3004,5006),
					(70003,2480.4,'2012-10-10',3009,5003),
					(70012,250.45,'2012-06-27',3008,5002),
					(70011,75.29,'2012-08-17',3003,5007),
					(70013,3045.6,'2012-04-25',3002,5001);


select * from  orders;
select * from  salesman;
select * from customer;

-- 1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city

select s.name as Salesman_Name, c.cust_name as Customer_name,c.city
from salesman s join customer c 
on s.city= c.city

--2. Write a SQL statement to make a list with order no, purchase amount, customer name and
--their cities for those orders which order amount between 500 and 2000
select o.ord_no ,o.purch_amt, c.cust_name, c.city 
from orders o join customer c
on c.customer_id=o.customer_id
where purch_amt between 500 and 2000;

--3. Write a SQL statement to know which salesman are working for which customer.
select s.name as Name,c.cust_name as Customer_Name
from salesman s join customer c
on s.salesman_id=c.salesman_id

--4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%
select c.cust_name,c.city, s.commission from salesman s join customer c
on  s.salesman_id= c.salesman_id
where commission > 0.12

--5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12%
select c.cust_name,c.city, s.commission from salesman s join customer c
on  s.salesman_id= c.salesman_id
where s.city != c.city and commission > 0.12

--6. Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order.
select o.ord_no, o.ord_date, o.purch_amt, c.cust_name,s.commission,c.grade
from  orders o
INNER JOIN customer c
ON o.customer_id=c.customer_id 
INNER JOIN salesman s 
ON o.salesman_id=c.salesman_id;

SELECT a.ord_no,a.ord_date,a.purch_amt,
b.cust_name AS "Customer Name", b.grade, 
c.name AS "Salesman", c.commission 
FROM orders a 
INNER JOIN customer b 
ON a.customer_id=b.customer_id 
INNER JOIN salesman c 
ON a.salesman_id=c.salesman_id;
--7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come.
 select o.ord_no, o.ord_date, o.purch_amt, c.cust_name,c.city,s.commission,s.name
 from orders o
 join customer c on c.customer_id=o.customer_id
 join salesman s on s.salesman_id= o.salesman_id;
--8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. 
select c.cust_name,c.city,c.grade, s.name,s.city
from customer c
left join salesman s on c.salesman_id= s.salesman_id
order by c.customer_id


--9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own. 
select c.cust_name,c.city,c.grade, s.name,s.city
from customer c
left join salesman s on c.salesman_id= s.salesman_id
where c.grade < 300
order by c.customer_id;

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.
select c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt
from customer c
left join orders o on c.customer_id=o.customer_id
order by o.ord_date;

--11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount salesman name and commission to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own. 
select  c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt ,s.commission
from customer c
left join orders o on c.customer_id=o.customer_id
left join salesman s on s.salesman_id= o.salesman_id


--12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.  
select s.name,c.cust_name
from customer c join salesman s
on c.salesman_id=s.salesman_id
order by s.name;

--13. Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier.
select  s.name,s.city,c.cust_name
from customer c
right join salesman s on s.salesman_id=c.salesman_id
right join orders o on o.customer_id= c.customer_id



--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.
SELECT c.cust_name,c.city,c.grade, 
s.name, 
o.ord_no, o.ord_date, o.purch_amt 
FROM customer c
RIGHT  JOIN salesman s
ON s.salesman_id=c.salesman_id 
LEFT JOIN orders o 
ON o.customer_id=c.customer_id 
WHERE o.purch_amt>=2000 AND c.grade IS NOT NULL;
--15 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list.
SELECT c.cust_name,c.city,c.grade, o.ord_no, o.ord_date, o.purch_amt 
from customer c
left join orders o
ON o.customer_id=c.customer_id 
--16 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list not have a grade. 
SELECT c.cust_name,c.city,c.grade, o.ord_no, o.ord_date, o.purch_amt 
from customer c
left join orders o
ON o.customer_id=c.customer_id 
where c.grade is not null
--17 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa.
select *
from salesman s
cross join customer c

--18 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that customer who belongs to a city.
select *
from salesman s
cross join customer c
where c.city is not null;
--19 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who belongs to a city and the customers who must have a grade. 
select *
from salesman s
cross join customer c
where c.city is not null and  grade is not null;
--20 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade. 
select *
from salesman s
cross join customer c
where c.city !=s.city  and  grade is not null;
--21 . Write a SQL query to display all the data from the item_mast, including all the data for each item's producer company.
select i.PRO_ID, i.PRO_NAME, i.PRO_PRICE, i.PRO_COM ,co.COM_ID,co.COM_NAME
FROM item_mast i
JOIN company_mast co
on i.PRO_COM=co.COM_ID;

--22 . Write a SQL query to display the item name, price, and company name of all the product
select i.PRO_NAME, i.PRO_PRICE ,co.COM_NAME
FROM item_mast i
 full outer JOIN company_mast co
on i.PRO_COM=co.COM_ID;

--23 . Write a SQL query to display the average price of items of each company, showing the name of the company. 
select  avg(PRO_PRICE),co.COM_NAME
FROM item_mast i
JOIN company_mast co
on i.PRO_COM=co.COM_ID
group by co.COM_NAME;

--24 . Write a SQL query to display the names of the company whose products have an average price larger than or equal to Rs. 350.
SELECT  avg(PRO_PRICE), co.COM_NAME
FROM item_mast i
JOIN company_mast co
on i.PRO_COM=co.COM_ID
group by co.COM_NAME
HAVING avg(i.PRO_PRICE)>=350;
--25 . Write a SQL query to display the name of each company along with the ID and price for their most expensive product.
select co.COM_ID, MAX(i.PRO_PRICE),co.COM_NAME
FROM item_mast i
JOIN company_mast co
on i.PRO_COM=co.COM_ID;
--26 . Write a query in SQL to display all the data of employees including their department
select *
from emp_details e
inner join emp_department d
on e.EMP_DEPT=d.DPT_CODE


--27 . Write a query in SQL to display the first name and last name of each employee, along with the name and sanction amount for their department.
select  e.EMP_FNAME,e.EMP_LNAME , d. DPT_ALLOTMENT as sanction_amount
from emp_details e
inner join emp_department d
on e.EMP_DEPT=d.DPT_CODE

--28 . Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000. 
select  e.EMP_FNAME,e.EMP_LNAME , d. DPT_ALLOTMENT 
from emp_details e
inner join emp_department d
on e.EMP_DEPT=d.DPT_CODE
where d.DPT_ALLOTMENT >50000       
--29 . Write a query in SQL to find the names of departments where more than two employees are working.
select  d.DPT_NAME 
from emp_details e
 RIGHT join emp_department d
on e.EMP_DEPT=d.DPT_CODE
GROUP BY DPT_NAME 
HAVING COUNT(EMP_DEPT)>2
--30 . Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'
SELECT o.ord_no,s.name
from orders o
inner join salesman s
on s.salesman_id=o.salesman_id
where name='Paul Adam';
--31 . Write a query to display all the orders for the salesman who belongs to the city London. ****
SELECT *
from orders o
left join salesman s
on o.salesman_id=s.salesman_id
where s.city='London';
--32 . Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007.
SELECT *
from orders o
left join salesman s
on o.salesman_id=s.salesman_id
where o.customer_id =3007;
--33 . Write a query to display all the orders which values are greater than the average order value for 10th October 2012.
SELECT *
from orders o
where purch_amt >(select avg(purch_amt) from orders where ord_date='2012-10-10' )
--34 . Write a query to find all orders attributed to a salesman in New york.
select * from orders o
left join salesman s
 on o.salesman_id= s.salesman_id
where city='New York';
--35 . Write a query to count the customers with grades above New York's average
select grade, count(*) from customer 
group by grade
having grade >(select avg(grade) from customer where city='New York ');
--36 . Write a query to display all the customers with orders issued on date 17th August, 2012
select * from customer c
left join orders o
on c.salesman_id=o.salesman_id
where ord_date='2012-08-17';
--37 . Write a query to find the name and numbers of all salesmen who had more than one customer. 
select s.name,s.salesman_id
from salesman s
where 1<( select count(*) from customer c
where s.salesman_id = c.salesman_id )

--38 . Write a query to find all orders with order amounts which are above-average amounts for their customers.
select *
from orders o
where o.purch_amt>( select avg(c.purch_amt) from orders c where c.salesman_id=o.salesman_id)

--39 . Write a queries to find all orders with order amounts which are on or above-average amounts for their customers.  
select * from orders o
where o.purch_amt>=(select avg(purch_amt) from orders c
where c.customer_id=o.customer_id);

--40 . Write a query to find the sums of the amounts from the orders table, grouped by date, eliminating all those dates
--where the sum was not at least 1000.00 above the maximum order amount for that date
select o.ord_date ,sum(o.purch_amt)
from orders o
group by o.ord_date
having sum(o.purch_amt) > (select 1000 + max(purch_amt) from orders c where o.ord_date=c.ord_date);


--41 . Write a query to extract the data from the customer table if and only if one or more of the customers in the customer table are located in London. 
 select * from customer 
 where exists (select * from customer where city ='London');
--42 . Write a query to find the salesmen who have multiple customers. 
select s.salesman_id, s.name
from salesman s
where 1 < ( select count(*) from customer c where c.salesman_id= s.salesman_id);
--43 . Write a query to find all the salesmen who worked for only one customer
 select * from salesman s
 where 1 = ( select count(*) from customer c where c.salesman_id= s.salesman_id);
--44 . Write a query that extract the rows of all salesmen who have customers with more than one orders.
select s.salesman_id, s.name from salesman s,customer c
 where 1 < all( select count(*) from orders o where s.salesman_id= c.salesman_id);

--45 . Write a query to find salesmen with all information who lives in the city where any of the customers lives. 
select * from salesman s
inner join customer c
on c.city= s.city;

select * from salesman s, customer c
where c.city= s.city;
--46 . Write a query to find all the salesmen for whom there are customers that follow them.
select * from salesman s,customer c
where c.salesman_id=s.salesman_id;
--47 . Write a query to display the salesmen which name are alphabetically lower than the name of the customers.
select * from salesman s
where exists (select * from customer c where s.name < c.cust_name);
--48 . Write a query to display the customers who have a greater gradation than any customer who belongs to the alphabetically lower than the city New York.
select * from customer 
where grade > any(select grade from customer  where city <  'New York');
--49 . Write a query to display all the orders that had amounts that were greater than at least one of the orders on September 10th 2012. 
select * from  orders
where purch_amt >any (select purch_amt from orders where ord_date='2012-09-10')
--50 . Write a query to find all orders with an amount smaller than any amount for a customer in London.
select * from orders o
where purch_amt < any ( select purch_amt  from orders o,customer c where city='London' and  o.customer_id=c.customer_id);
--51 . Write a query to display all orders with an amount smaller than any amount for a customer in London.
select * from orders o
where purch_amt < any ( select purch_amt  from orders o,customer c where city='London' and  o.customer_id=c.customer_id);
--52 . Write a query to display only those customers whose grade are, in fact, higher than every customer in New York. 
select * from customer c
where c.grade>all( select c.grade from customer c where c.city='New York');
--53 . Write a query to find only those customers whose grade are, higher than every customer to the city New York. 
select * from customer c
where c.grade > all( select c.grade from customer c where c.city='New York' );
--54 . Write a query to get all the information for those customers whose grade is not as the grade of customer who belongs to the city London
select * from customer c
where c.grade not in( select c.grade from customer c where c.city='London' and c.grade is not null);
--55 . Write a query to find all those customers whose grade are not as the grade, belongs to the city Paris.
select * from customer c
where c.grade not in( select c.grade from customer c where c.city='Paris' );
--56 . Write a query to find all those customers who hold a different grade than any customer of the city Dallas.
select * from customer c
where not c.grade= any(select c.grade from customer c where c.city='Dallas');
--57 . Write a SQL query to find the average price of each manufacturer's products along with their name.
select avg(PRO_PRICE), co.COM_NAME
from company_mast co, item_mast i
where i.PRO_COM= co.COM_ID
 group by co.COM_NAME;
--58 . Write a SQL query to display the average price of the products which is more than or equal to 350 along with their names.
select avg(PRO_PRICE), co.COM_NAME
from company_mast co, item_mast i
where i.PRO_COM= co.COM_ID
 group by co.COM_NAME
having avg(PRO_PRICE) >= 350;

--59 . Write a SQL query to display the name of each company, price for their most expensive product along with their Name.
select i.PRO_NAME ,i.PRO_PRICE,co.COM_NAME
from item_mast i, company_mast co
where i.PRO_COM=co.COM_ID
and i.PRO_PRICE =(select max(i.PRO_PRICE) from item_mast i where i.PRO_COM=co.COM_ID);