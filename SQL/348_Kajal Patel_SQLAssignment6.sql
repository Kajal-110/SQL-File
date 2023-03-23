use KP348KajalPatel;

select * from sys.objects where type='u';

create table customer_detail(customer_id int primary key,
					  cust_name varchar(250) not null,
					  city varchar(250) not null,
					  );

insert into customer_detail(customer_id,cust_name,city)
				values(3001,'Brad Guzan','London'),
				(3002,'Nick Rimando','New York'),
				(3003,'Brad Davis', 'New York'),
				(3004,'Graham Zusi' ,'California'),
				(3005,'Julian Green', 'London'),
				(3006,'Fabian Johnson','Paris'),
				(3007,'Geoff Cameron','Berlin'),
				(3008,'Jozy Altidor',' Moscow');


select * from customer;

create table orders_detail(ord_no int primary key ,
					purch_amt decimal(10,2),
					ord_date  date,
					PRO_ID INT
					foreign key(PRO_ID) references Product_detail(PRO_ID),
					customer_id int
					foreign key(customer_id) references customer_detail(customer_id)
					);




insert into orders_detail(ord_no,purch_amt,ord_date,PRO_ID,customer_id)
			values(70001 ,150.5, '2012-10-05',101,3001),
					(70009,270.65,' 2012-09-10',102,3002),
					(70002, 65.26,'2012-10-05',103,3004),
					(70004,110.5,'2012-08-17',104,3003),
					(70007,948.5,'2012-09-10',105,3005),
					(70005,2400.6,'2012-07-27',106,3006),
					(70008,5760,'2012-09-10',103,3007),
					(70010,1983.43,'2012-10-10',104,3008),
					(70003,2480.4,'2012-10-10',101,3008),
					(70012,250.45,'2012-06-27',107,3006),
					(70011,75.29,'2012-08-17',108,3004),
					(70013,3045.6,'2012-04-25',110,3002);

select * from orders_detail;

create table Product_detail(PRO_ID int primary key,
			PRO_NAME varchar(250),
			PRO_PRICE  decimal(5,1),
			);


insert into Product_detail(PRO_ID, PRO_NAME,PRO_PRICE)
				  values(101,' Mother Board ',3200),
						(102, 'Key Board',450),
						(103, 'ZIP drive',250),
						(104 ,'Speaker',550),
						(105 ,'Monitor',5000 ),
						(106 ,'DVD drive',900),
						(107 ,'CD drive',800),
						(108 ,'Printer',2600),
						(109 ,'Refill cartridge',350),
						(110 ,'Mouse',250);

select * from Product_detail;

--1.Create a stored procedure called "get_customers" that returns all customers from the "customers" table.

create procedure proc_get_customers
as 
begin
select * from customer_detail
end

exec proc_get_customers;
go

--2.Create a stored procedure called "get_orders" that returns all orders from the "orders" table.

create procedure proc_get_orders
as 
begin
select * from orders_detail
end

exec proc_get_orders
go

--3.Create a stored procedure called "get_order_details" that accepts an order ID as a parameter and 
--returns the details of that order (i.e., the products and quantities).

create procedure proc_get_order_details @ord_no int
as
begin
select * from orders where ord_no=@ord_no;
end

exec proc_get_order_details 70003

go

--4.Create a stored procedure called "get_customer_orders" that accepts a customer ID as a parameter and returns all orders for that customer.
 alter procedure proc_get_customer_orders  @customer_id int
 as 
 begin
 select * from customer_detail c
 right join  orders_detail o
 on c.customer_id= o.customer_id
 where c.customer_id=@customer_id
 end

 exec proc_get_customer_orders 3004

 go
 --5.Create a stored procedure called "get_order_total" that accepts an order ID as a parameter and returns the total amount of the order.
create procedure  proc_get_order_total @pro_id int
as 
begin
select sum(purch_amt) from orders_detail where PRO_ID= @pro_id

end

exec proc_get_order_total 101

--6.Create a stored procedure called "get_product_list" that returns a list of all products from the "products" table.
create procedure proc_get_product_list
as
begin
select * from Product_detail
end

exec proc_get_product_list
go

--7.Create a stored procedure called "get_product_info" that accepts a product ID as a parameter and returns the details of that product.
create procedure proc_get_product_info @PRO_ID int
as
begin
select * from Product_detail where PRO_ID=@PRO_ID
end


exec proc_get_product_info 107
go

--8.Create a stored procedure called "get_customer_info" that accepts a customer ID as a parameter and returns the details of that customer.
create procedure proc_get_customer_info @customer_id int
as
begin
select * from customer_detail where customer_id=@customer_id
end

exec proc_get_customer_info 3004
go
--9.Create a stored procedure called "update_customer_info" that accepts a customer ID
--and new information as parameters and updates the customer's information in the "customers" table.

create procedure proc_update_customer_info  @customer_id int
as
begin
update customer_detail set cust_name= 'Kajal'
where customer_id=@customer_id
end

exec proc_update_customer_info 3008
go

select * from customer_detail;
go
--10.Create a stored procedure called "delete_customer" that accepts a customer ID as a parameter and deletes that customer from the "customers" table.
alter procedure proc_delete_customer   @customer_id int
as
begin
delete from customer_detail where  @customer_id= customer_id 
end

exec proc_delete_customer  3001  --there is a error because customer_id is a foreign key in orders_detail table
go

--11.Create a stored procedure called "get_order_count" that accepts a customer ID as a parameter and returns the number of orders for that customer.
alter procedure proc_get_order_count @customer_id int
as
begin
select count(*) as number_of_orders from orders_detail
where @customer_id=customer_id
end

exec proc_get_order_count  3004
go

--12.Create a stored procedure called "get_customer_balance" that accepts a customer ID as a parameter and returns 
--the customer's balance (i.e., the total amount of all orders minus the total amount of all payments).****
create procedure proc_get_customer_balance @customer_id int
as
begin
select sum(purch_amt)-( select sum(purch_amt) from orders_detail where @customer_id=customer_id)  from orders_detail
end

exec proc_get_customer_balance 3002

go 
select * from customer_detail
go

--13.Create a stored procedure called "get_customer_payments" that accepts a customer ID as a parameter and returns all payments made by that customer.
alter procedure proc_get_customer_payments @customer_id int
as
begin
select count(purch_amt),customer_id from orders_detail where  customer_id= @customer_id
group by customer_id
end

exec proc_get_customer_payments 3002
go

--14.Create a stored procedure called "add_customer" that accepts a name and address as parameters and adds a new customer to the "customers" table.

alter procedure proc_add_customer @customer_id int, @cust_name varchar(250) ,@city varchar(250)
as
begin
insert into customer_detail(customer_id,cust_name,city) values(@customer_id,  @cust_name,@city)
end
exec proc_add_customer 3009,'Simran','Jammu'
go
select * from customer_detail
go
--15.Create a stored procedure called "get_top_products" that returns the top 10 products based on sales volume.
create procedure proc_get_top_products
as
begin
select top 10  PRO_ID, sum(purch_amt) from orders_detail
group by PRO_ID
order by sum(purch_amt)
desc
end

exec proc_get_top_products
go

select * from Product_detail
go

--16.Create a stored procedure called "get_product_sales" that accepts a product ID as a parameter and returns the total sales volume for that product.
alter procedure proc_get_product_sales  @PRO_ID int
as
begin
select PRO_ID,sum(PRO_PRICE) as Total_sales  from Product_detail where @PRO_ID=PRO_ID
group by PRO_ID
end

exec proc_get_product_sales 102

go


--17.Create a stored procedure called "get_customer_orders_by_date" that accepts a customer ID and date range as
--parameters and returns all orders for that customer within the specified date range.

create procedure proc_get_customer_orders_by_date @customer_id int, @start_date date, @end_date date
as
begin
select * from orders_detail where customer_id=@customer_id and  ord_date between @start_date and @end_date
end
exec proc_get_customer_orders_by_date 3002 ,'2012-03-10','2012-08-27'

select * from orders_detail 
go
--18.Create a stored procedure called "get_order_details_by_date" that accepts an order ID and date range as parameters and
--returns the details of that order within the specified date range.
create procedure proc_get_customer_orders_by_date @ord_no int, @start_date date, @end_date date
as
begin
select * from orders_detail where ord_no=@ord_no and  ord_date between @start_date and @end_date
end

exec proc_get_customer_orders_by_date 70013 ,'2012-03-10','2012-08-27'

go

--19.Create a stored procedure called "get_product_sales_by_date" that accepts a product ID and date range as parameters and returns the total sales
--volume for that product within the specified date range.
alter procedure proc_get_product_sales_by_date  @PRO_ID int, @start_date date, @end_date date
as
begin
select count(ord_no) as Total_sales from  orders_detail o
right join Product_detail p
on p.PRO_ID= o.PRO_ID
where p.PRO_ID=@PRO_ID AND ord_date between @start_date and @end_date
end 

exec proc_get_product_sales_by_date 101,'2012-10-04','2012-10-11'
go

--20.Create a stored procedure called "get_customer_balance_by_date" that accepts a customer ID and date range as parameters and returns the customer's
--balance within the specified date range.
create procedure proc_get_customer_balance_by_date @customer_id int, @start_date date, @end_date date
as
begin
select * from customer_detail c
inner join orders_detail o
on o.customer_id= c.customer_id
where @customer_id=c.customer_id
end

exec proc_get_customer_balance_by_date 3004,'2012-10-04','2012-10-11'
go

--21.Create a stored procedure called "add_order" that accepts a customer ID, order date, and total amount as parameters 
--and adds a new order to the "orders" table.
alter procedure proc_add_order @ord_no int ,@purch_amt decimal(10,2),  @ord_date date  ,@PRO_ID int, @customer_id int
as
begin
insert into orders_detail(ord_no,purch_amt,ord_date,PRO_ID,customer_id) values(@ord_no,@purch_amt,@ord_date,@PRO_ID,@customer_id)
end
exec proc_add_order 70014,5530,'2022-01-23',106,3006
go
--22.Create a stored procedure called "update_order_total" that accepts an order ID and a new total amount as parameters and
--updates the total amount of the order in the "orders" table.

create procedure proc_update_order_total  @purch_amt decimal(10,2) ,@ord_no int
as
begin
update orders_detail set purch_amt=@purch_amt where ord_no=@ord_no
end

exec proc_update_order_total 4000,70011

GO
--23.Create a stored procedure called "delete_order" that accepts an order ID as a parameter and deletes that order from the "orders" table.
create procedure proc_delete_order @ord_no int
as
begin
delete from orders_detail where ord_no=@ord_no
end

exec proc_delete_order 70008
go

select * from Product_detail 
select * from orders_detail
select * from customer_detail

