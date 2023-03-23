use KP348KajalPatel;

create table Employees(Employee_Id int primary key identity(1,1),
						Employee_Name varchar(250) not null,
						Department  varchar(250) not null,
						Salary decimal(10,5),
						Hire_Date date );

insert into Employees(Employee_Name ,Department ,Salary ,Hire_Date)
				values('Kajal','IT',30000,'2013-12-11'),
				('Shivani', 'HR',32000,'2018-10-01'),
				('Pooja','QA',28000,'2019-09-03'),
				('Simran','SDE',20000,'2023-02-23'),
				('Nikki','Finance',25000,'2022-10-24'),
				('Aakash','IT',30000,'2013-06-11'),
				('Vishal', 'RD',32000,'2021-09-01'),
				('Vikas','QA',28000,'2020-09-08'),
				('Yansi','Finance',20000,'2019-02-15'),
				('Dhurvi','QC',25000,'2022-11-04');

select * from Employees;

update Employees set Salary=51000 
where Employee_Name='Nikki';

--How many employees are in the table?
SELECT COUNT(Employee_Name) as Employee_Name from Employees;

--What is the highest salary in the table?
SELECT MAX(Salary) as Max_Salary from Employees;

--What is the average salary by department?
SELECT AVG(Salary) as Avg_Salary from Employees;

--Who are the top 5 highest paid employees?
 SELECT TOP 5 Salary,Employee_Name from Employees
 order by Salary desc;

 --How many employees were hired in the last year?
select * FROM Employees
WHERE ( SELECT DATEDIFF( YEAR,Hire_Date,GETDATE()))=1;

--How do you select all columns from a table named "employees"?
  select  * from Employees

--How do you select only the "employee_id" and "employee_name" columns from a table named "employees"?
  select Employee_Id,Employee_Name from Employees;

--How do you filter records in a table named "employees" to only include those where the "salary" column is 
--greater than or equal to 50000?
 select * from Employees
  where Salary >= 50000;

--How do you filter records in a table named "employees" to only include those where the "department" column is "Sales"?
select * from Employees
where Department='IT';

--How do you filter records in a table named "employees" to only include those where the "hire_date" column is between
--January 1, 2022 and December 31, 2022?
 select  * from Employees
 where Hire_Date between '2022-01-01' and  '2022-12-31';

--How do you calculate the average salary of all employees in a table named "employees"?
SELECT AVG(Salary) As Average_Salary from Employees;

--How do you calculate the total salary of all employees in a table named "employees"?
SELECT SUM(Salary) As Total_Salary from Employees;

--How do you calculate the highest salary in a table named "employees"?
SELECT MAX(Salary) As Highest_Salary from Employees;

--How do you calculate the lowest salary in a table named "employees"?
SELECT MIN(Salary) As lowest_Salary from Employees;


--How do you calculate the number of employees in a table named "employees"?
SELECT COUNT(Employee_Name) as Employee_Name from Employees;

--How do you sort the records in a table named "employees" by the "salary" column in ascending order?

SELECT * FROM Employees
ORDER BY Salary;

--How do you sort the records in a table named "employees" by the "salary" column in descending order?
SELECT * FROM Employees
ORDER BY Salary DESC;


--How do you count the number of employees in each department in a table named "employees"?

SELECT  Department, COUNT(Department) as Department FROM Employees
GROUP BY Department;

--How do you select the first 10 records in a table named "employees"?
SELECT TOP 6 Salary, Employee_Id, Employee_Name,Department,Hire_Date from Employees
order by Salary ;


--How do you select the last 10 records in a table named "employees"?
SELECT TOP 6 Salary,Employee_Id,Employee_Name,Department,Hire_Date from Employees
order by Salary desc;

--How do you select the top 5 highest paid employees from a table named "employees"?
 SELECT TOP 5 Salary,Employee_Name from Employees
 order by Salary desc;

 --How do you select the top 10 highest paid employees from a table named "employees"?
  SELECT TOP 8 Salary,Employee_Name from Employees
 order by Salary desc;

 --How do you select the bottom 5 lowest paid employees from a table named "employees"?
  SELECT TOP 8 Salary,Employee_Name from Employees
 order by Salary ;


--How do you select the employees who have a salary that is above the average salary in a table named "employees"?
SELECT Employee_Name ,Salary from Employees
where Salary > ( select AVG(Salary) from Employees);

--How do you select the employees who have a salary that is below the average salary in a table named "employees"?
SELECT Employee_Name ,Salary from Employees
where Salary < ( select AVG(Salary) from Employees);

--How do you select the employees who have a salary that is between 40000 and 60000 in a table named "employees"?
SELECT Employee_Name, Salary FROM Employees
WHERE Salary between 40000 and 60000;

--How do you calculate the total salary of all employees in each department in a table named "employees"?
SELECT sum(Salary) as Salary ,Department from Employees
group by Department ,Salary;

--How do you calculate the average salary of all employees in each department in a table named "employees"?
SELECT AVG(Salary) as Salary ,Department from Employees
group by Department ,Salary;

--How do you calculate the highest salary of all employees in each department in a table named "employees"?
SELECT max(Salary) as Salary ,Department from Employees
group by Department ,Salary;

--How do you calculate the lowest salary of all employees in each department in a table named "employees"?
SELECT MIN(Salary) as Salary ,Department from Employees
group by Department ,Salary;

--How do you select the employees who have been hired in the last year from a table named "employees"?
select * FROM Employees
WHERE ( SELECT DATEDIFF( YEAR,Hire_Date,GETDATE()))=1;

--How do you select the employees who have been hired in the last 6 months from a table named "employees"?
select * FROM Employees
WHERE ( SELECT DATEDIFF( Month,Hire_Date,GETDATE()))<=6;

--How do you select the employees who have been hired in the last 3 months from a table named "employees"?
select * FROM Employees
WHERE ( SELECT DATEDIFF( Month,Hire_Date,GETDATE()))<=3;
--How do you select the employees who have been hired in the last week from a table named "employees"?
select * FROM Employees
WHERE ( SELECT DATEDIFF( WEEK,Hire_Date,GETDATE()))<=1;

--How do you select the employees who have a name that starts with the letter "A" in a table named "employees"?
select *  from  Employees
where Employee_Name Like 'K%';

--How do you select the employees who have a name that ends with the letter "s" in a table named "employees"?
select *  from  Employees
where Employee_Name Like '%an';