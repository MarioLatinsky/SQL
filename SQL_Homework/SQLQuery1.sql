CREATE DATABASE SEDC

create table dbo.BusinessEntity(

Id int identity (1,1) not null, 
Name nvarchar(100) null,
Region nvarchar(1000) null,
ZipCode nvarchar(10) null,
Size nvarchar(10) null
constraint PK_BusinessEntity primary key clustered (Id)
)


select *
from dbo.BusinessEntity


create table dbo.Employee(
Id int identity (1,1) not null,
FirstName nvarchar(100) not null, 
LastName nvarchar(100) not null,
DateOfBirth date null,
Gender nchar(1) null, 
HireDate date null,
NationalIdNumber nvarchar(20) null
constraint PK_Employee primary key clustered (Id)

)


select *
from dbo.Employee


create table dbo.Product(
Id int identity (1,1) not null, 
Code nvarchar(50) null, 
Name nvarchar(100) null,
Description nvarchar(MAX) null, 
weight decimal(18, 2) null, 
Price decimal (18, 2) null, 
Cost decimal  (18, 2) null
constraint PK_Product primary key clustered (Id)

)


select *
from dbo.Product


create table dbo.Customer(
Id int identity (1,1) not null, 
Name nvarchar(100) not null, 
AccountNumber nvarchar(50) null, 
City nvarchar(100) null, 
RegionName nvarchar(100) null,
CustomerSize nvarchar(10) null,
PhoneNumber nvarchar(20) null,
isActive bit not null
constraint PK_Customer primary key clustered (Id)
)

select *
from dbo.Customer



create table dbo.OrderTable(
Id int identity (1,1) not null, 
OrderDate datetime null,
Status smallint null, 
BusinessEntityId int null, 
CustomerId int null, 
EmployeeId int null, 
TotalPrice decimal(18,2) null, 
Comment nvarchar(MAX) null
constraint PK_OrderTable primary key clustered (Id)
)

select *
from dbo.OrderTable

create table dbo.OrderDetails (
Id bigint identity(1,1) not null,
OrderId bigint null,
ProductId int null,
Quantity int null, 
Price decimal(18,2) null
constraint PK_OrderDetails primary key clustered (Id)

)

select *
from dbo.OrderDetails