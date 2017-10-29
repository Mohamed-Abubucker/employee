use employee
go

CREATE TABLE [dbo].[departments_master](
[DEPT_CODE] int PRIMARY KEY,
[DEPT_NAME] nvarchar(100),
[DEPT_ADDR] nvarchar(200)
)

go

CREATE TABLE [dbo].[designations_master](
[DESGIN_ID] int PRIMARY KEY,
[DESIGNATION] nvarchar(30) not null,
[DESCRIPTION] nvarchar(100) null
)

go

CREATE TABLE [dbo].[employee](
[ID] int PRIMARY KEY,
[NAME] nvarchar(50),
[DOJ] datetime,
[MOBILE] varchar(10),
[EMAIL] varchar(30),
[SALARY] money,
DESIGN int FOREIGN KEY REFERENCES [designations_master]([DESGIN_ID]), 
DEPT int FOREIGN KEY REFERENCES [departments_master]([DEPT_CODE]) 
)

go

CREATE PROCEDURE [dbo].[createEmployee](
@name nvarchar(50),
@doj datetime,
@mobile varchar(10),
@email varchar(30),
@salary money,
@design int,
@dept int
)
AS
BEGIN
	BEGIN TRANSACTION
		insert into [dbo].[employee]([NAME],[DOJ],[MOBILE],[EMAIL],[SALARY],DESIGN,DEPT) values(@name,@doj,@mobile,@email,@salary,@design,@dept)
	COMMIT TRANSACTION



insert into [dbo].[departments_master]([DEPT_CODE],[DEPT_NAME],[DEPT_ADDR]) values(101,'HR','Human Resource Management Department')
insert into [dbo].[departments_master]([DEPT_CODE],[DEPT_NAME],[DEPT_ADDR]) values(102,'Finance','Accounts and FInance Department')
insert into [dbo].[departments_master]([DEPT_CODE],[DEPT_NAME],[DEPT_ADDR]) values(103,'Sales','Sale and Revenue Department')
insert into [dbo].[departments_master]([DEPT_CODE],[DEPT_NAME],[DEPT_ADDR]) values(104,'Production','Production Department')
insert into [dbo].[departments_master]([DEPT_CODE],[DEPT_NAME],[DEPT_ADDR]) values(105,'IT','Technical and IT Team')

insert into [dbo].[designations_master]([DESGIN_ID],[DESIGNATION],[DESCRIPTION]) values(201,'Manager','Manger for the respected Department.')
insert into [dbo].[designations_master]([DESGIN_ID],[DESIGNATION],[DESCRIPTION]) values(202,'Supervisor','Block Supervisor')
insert into [dbo].[designations_master]([DESGIN_ID],[DESIGNATION],[DESCRIPTION]) values(203,'Incharge','Project Incharge')
insert into [dbo].[designations_master]([DESGIN_ID],[DESIGNATION],[DESCRIPTION]) values(204,'Senior','Senior Employee')
insert into [dbo].[designations_master]([DESGIN_ID],[DESIGNATION],[DESCRIPTION]) values(205,'Junior','Entry Level')



select * from employee
select * from designations_master
select * from departments_master


DROP TABLE [dbo].[employee]

CREATE TABLE [dbo].[employee](
[ID] int IDENTITY(1,1) PRIMARY KEY,
[NAME] nvarchar(50),
[DOJ] datetime,
[MOBILE] varchar(10),
[EMAIL] varchar(30),
[SALARY] money,
DESIGN int FOREIGN KEY REFERENCES [designations_master]([DESGIN_ID]), 
DEPT int FOREIGN KEY REFERENCES [departments_master]([DEPT_CODE]) 
)