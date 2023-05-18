create database SEDCACADEMYDB


create table dbo.Student(
Id int identity(1,1) not null,
FirstName nvarchar(10) not null,
LastName nvarchar(20) not null, 
DateOfBirth date null, 
EnrolledDate date null,
Gender nchar(1) null, 
NationalIdNumber nvarchar(20) null, 
StudentCardNumber nvarchar(10) null
constraint PK_Student primary key clustered(Id)
)


create table dbo.Teacher(
Id int identity(1,1) not null, 
FirstName nvarchar(10) not null,
LastName nvarchar(20) not null, 
DateOfBirth date null, 
AcademicRank nvarchar(15) null, 
HireDate date null
constraint PK_Teacher primary key clustered(Id)
)


create table dbo.Grade(
Id int identity(1,1) not null, 
StudentId int null, 
CourseId int null, 
TeacherId int null, 
Grade nchar(1) null, 
Comment nvarchar(MAX) null, 
CreatedDate date null
constraint PK_Grade primary key clustered(Id)
)


create table dbo.Course(
Id int identity(1,1) not null,
Name nvarchar(10) not null, 
Credit int null, 
AcademicYear date null, 
Semester int null
constraint PK_Course primary key clustered(Id)
)

create table dbo.GradeDetails(
Id int identity (1,1) not null, 
GradeId int null, 
AchievementTypeId int null, 
AchievementPoints int null, 
AchievementMaxPoints int not null, 
Achievement date null
constraint PK_GradeDetails primary key clustered(Id)
)

create table dbo.AchievementType(
id int identity (1,1) not null, 
Name nvarchar(10) null, 
Description nvarchar(MAX) null, 
ParticipiationRate int null 
constraint PK_AchievementType primary key clustered(Id)
)