

 --Create Database 
create database KP348KajalPatel;

use KP348KajalPatel;

--Create Table
create table StudentAdmissionDetail(
StudentId int primary key identity(1,1),
StudentFirstName varchar(250),
StudentLastName varchar(250),
StudentDOB datetime not null,
StudentAdherNumber varchar(12) unique ,
StudentClassOfAdmission int not null,
StudentMotherName varchar(250),
StudentFatherName varchar(250),
StudentParmanentAddress nvarchar(max),
StudentCurrentAddress nvarchar(max),
StudentGender varchar(50),
StudentBloodGroup bit,
studentAge int ,
StudentMediumOfAdmission varchar(50),
StudentCountryOfCitizenship varchar(100),
StudentFatherQualification varchar(50),
StudentFatherOccupation varchar(50),
StudentFatherMobileNo  varchar(50),
StudentMotherQualification varchar(50),
StudentMotherOccupation varchar(50),
StudentMotherMobileNo  varchar(50)
)


select * from StudentAdmissionDetail;

--Alter Table
ALTER TABLE StudentAdmissionDetail
ALTER COLUMN StudentBloodGroup varchar(10);

update  StudentAdmissionDetail set StudentBloodGroup='B+'
where StudentFirstName='xyz';

ALTER TABLE StudentAdmissionDetail
ADD CONSTRAINT CHK_studentAge CHECK (studentAge > 5);

update StudentAdmissionDetail set StudentFatherName='XYZ'


ALTER TABLE StudentAdmissionDetail
ADD StudentDisability bit;

ALTER TABLE StudentAdmissionDetail
ALTER COLUMN StudentDOB DATETIME;


ALTER TABLE StudentAdmissionDetail
ADD StudentDataCreatedOn date;

ALTER TABLE StudentAdmissionDetail
ADD StudentDataCreatedBy varchar(255);

ALTER TABLE StudentAdmissionDetail
ADD StudentDataModifyOn date;

ALTER TABLE StudentAdmissionDetail
ADD StudentDataModifyBy varchar(255);

ALTER TABLE StudentAdmissionDetail
ADD StudentDataDeletedOn date;

ALTER TABLE StudentAdmissionDetail
ADD StudentDataDeletedBy varchar(255);


--ALTER TABLE StudentAdmissionDetail
--ADD StudentFees decimal(10,5) after  StudentClassOfAdmission;   -->  After wa can't use in sql

ALTER TABLE StudentAdmissionDetail
ADD StudentFees decimal(10,5)  ;

ALTER TABLE StudentAdmissionDetail
DROP COLUMN StudentDataDeleteedOn;

ALTER TABLE StudentAdmissionDetail
DROP COLUMN StudentDataDeletedBy;

--alter table StudentAdmissionDetail
--alter column StudentDataCreatedOn  CURRENT_TIMESTAMP;

--Add Constraints using Alter
ALTER TABLE StudentAdmissionDetail ALTER  COLUMN StudentFirstName varchar(250) NOT NULL;

ALTER TABLE StudentAdmissionDetail ALTER  COLUMN StudentLastName varchar(250) NOT NULL;

ALTER TABLE StudentAdmissionDetail ALTER  COLUMN StudentMotherName varchar(250) NOT NULL;

ALTER TABLE StudentAdmissionDetail ALTER  COLUMN StudentFatherName varchar(250) NOT NULL;

ALTER TABLE StudentAdmissionDetail ALTER  COLUMN StudentFatherName varchar(250) NOT NULL;

ALTER TABLE StudentAdmissionDetail 
ADD CONSTRAINT df_StudentMotherOccupation DEFAULT 'HouseWife' FOR StudentMotherOccupation;


ALTER TABLE StudentAdmissionDetail 
ADD CONSTRAINT df_StudentDataCreatedOn  Default CURRENT_TIMESTAMP for StudentDataCreatedOn;

ALTER TABLE StudentAdmissionDetail 
ADD CONSTRAINT df_StudentDataModifyOn  Default CURRENT_TIMESTAMP for StudentDataModifyOn;


--Insert records in table
INSERT INTO StudentAdmissionDetail
           (StudentFirstName
           ,StudentLastName
           ,StudentDOB
           ,StudentAdherNumber
           ,StudentClassOfAdmission
           ,StudentMotherName
           ,StudentFatherName
           ,StudentParmanentAddress
           ,StudentCurrentAddress
           ,StudentGender
           ,StudentBloodGroup
           ,studentAge
           ,StudentMediumOfAdmission
           ,StudentCountryOfCitizenship
           ,StudentFatherQualification
           ,StudentFatherOccupation
           ,StudentFatherMobileNo
           ,StudentMotherQualification
           ,StudentMotherOccupation
           ,StudentMotherMobileNo)
     VALUES
            ('abc','patel','2007-11-09','103048456733',8,'neelam',
			'patel','jabalpur','jabalpur','male','',15,'english','indian','bsc','private worker',
			'7949653942','BSC','housewife','1687145543') ,

		    ('rmn','patel','2007-11-09','103048456744',10,'neelam',
			'patel','jabalpur','jabalpur','male','',17,'english','indian','bsc','private worker',
			'7949653945','BSC','housewife','1687145556','',1400),

			('shivani', 'patel', '2002-09-02','123065409870',9,'pooja',
			'dfs','UP','nagpur','Female' ,'AB+', 14 , 'Gujrati', 'Indian'
          ,'ITI', 'private worker', '7812365490', 'BSC','Govt worker', '7412503694','false',1800,'' ,'kajal', GETDATE(),'kajal', '' ,'');



--Delete records to table

delete  from StudentAdmissionDetail where StudentId=3;


--Update records   (With Transactions)

begin tran

update StudentAdmissionDetail set StudentDisability = 'false' where StudentFirstName='mno';

update StudentAdmissionDetail set StudentDisability = 'true' where StudentFirstName='xyz';

update StudentAdmissionDetail set StudentDisability = 'true' where StudentFirstName='abc';

update StudentAdmissionDetail  set StudentDOB ='2000-01-01'
WHERE StudentFirstName='abc';

update StudentAdmissionDetail set StudentMotherName = 'geeta' where StudentFirstName='Kajal';

update StudentAdmissionDetail set StudentParmanentAddress='bhopal',StudentCurrentAddress='bihar',StudentDisability='true',
StudentFees=3000, StudentDataCreatedBy='Kajal',StudentDataModifyBy='kajal'
where StudentFirstName='Kajal';

update StudentAdmissionDetail set StudentDataCreatedOn=getdate() where  StudentId=7;

update StudentAdmissionDetail set StudentFees=StudentFees+200 where StudentFees<=3000 ;



commit tran

rollback tran

--Retrive records from this tables

select * from  StudentAdmissionDetail;

select StudentFirstName ,StudentDOB,StudentAdherNumber,StudentClassOfAdmission,StudentGender from StudentAdmissionDetail;

select count(StudentFees) from  StudentAdmissionDetail;

select avg(StudentFees) as AverageFees from  StudentAdmissionDetail;

select StudentFirstName ,StudentDOB,StudentAdherNumber,StudentClassOfAdmission,StudentGender,studentAge
from StudentAdmissionDetail where studentAge > 15;






