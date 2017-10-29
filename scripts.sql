USE [master]
GO
/****** Object:  Database [EMPLOYEE]    Script Date: 10/29/2017 3:10:59 PM ******/
CREATE DATABASE [EMPLOYEE] ON  PRIMARY 
( NAME = N'EMPLOYEE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\EMPLOYEE.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EMPLOYEE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\EMPLOYEE_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EMPLOYEE] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EMPLOYEE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EMPLOYEE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EMPLOYEE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EMPLOYEE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EMPLOYEE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EMPLOYEE] SET ARITHABORT OFF 
GO
ALTER DATABASE [EMPLOYEE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EMPLOYEE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EMPLOYEE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EMPLOYEE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EMPLOYEE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EMPLOYEE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EMPLOYEE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EMPLOYEE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EMPLOYEE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EMPLOYEE] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EMPLOYEE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EMPLOYEE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EMPLOYEE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EMPLOYEE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EMPLOYEE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EMPLOYEE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EMPLOYEE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EMPLOYEE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EMPLOYEE] SET  MULTI_USER 
GO
ALTER DATABASE [EMPLOYEE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EMPLOYEE] SET DB_CHAINING OFF 
GO
USE [EMPLOYEE]
GO
/****** Object:  Table [dbo].[departments_master]    Script Date: 10/29/2017 3:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments_master](
	[DEPT_CODE] [int] NOT NULL,
	[DEPT_NAME] [nvarchar](100) NULL,
	[DEPT_ADDR] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[DEPT_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[designations_master]    Script Date: 10/29/2017 3:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[designations_master](
	[DESGIN_ID] [int] NOT NULL,
	[DESIGNATION] [nvarchar](30) NOT NULL,
	[DESCRIPTION] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[DESGIN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[employee]    Script Date: 10/29/2017 3:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[DOJ] [datetime] NULL,
	[MOBILE] [varchar](10) NULL,
	[EMAIL] [varchar](30) NULL,
	[SALARY] [money] NULL,
	[DESIGN] [int] NULL,
	[DEPT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[departments_master] ([DEPT_CODE], [DEPT_NAME], [DEPT_ADDR]) VALUES (101, N'HR', N'Human Resource Management Department')
GO
INSERT [dbo].[departments_master] ([DEPT_CODE], [DEPT_NAME], [DEPT_ADDR]) VALUES (102, N'Finance', N'Accounts and FInance Department')
GO
INSERT [dbo].[departments_master] ([DEPT_CODE], [DEPT_NAME], [DEPT_ADDR]) VALUES (103, N'Sales', N'Sale and Revenue Department')
GO
INSERT [dbo].[departments_master] ([DEPT_CODE], [DEPT_NAME], [DEPT_ADDR]) VALUES (104, N'Production', N'Production Department')
GO
INSERT [dbo].[departments_master] ([DEPT_CODE], [DEPT_NAME], [DEPT_ADDR]) VALUES (105, N'IT', N'Technical and IT Team')
GO
INSERT [dbo].[designations_master] ([DESGIN_ID], [DESIGNATION], [DESCRIPTION]) VALUES (201, N'Manager', N'Manger for the respected Department.')
GO
INSERT [dbo].[designations_master] ([DESGIN_ID], [DESIGNATION], [DESCRIPTION]) VALUES (202, N'Supervisor', N'Block Supervisor')
GO
INSERT [dbo].[designations_master] ([DESGIN_ID], [DESIGNATION], [DESCRIPTION]) VALUES (203, N'Incharge', N'Project Incharge')
GO
INSERT [dbo].[designations_master] ([DESGIN_ID], [DESIGNATION], [DESCRIPTION]) VALUES (204, N'Senior', N'Senior Employee')
GO
INSERT [dbo].[designations_master] ([DESGIN_ID], [DESIGNATION], [DESCRIPTION]) VALUES (205, N'Junior', N'Entry Level')
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

GO
INSERT [dbo].[employee] ([ID], [NAME], [DOJ], [MOBILE], [EMAIL], [SALARY], [DESIGN], [DEPT]) VALUES (2, N'Mohamed Abubucker', CAST(N'2016-01-01T00:00:00.000' AS DateTime), N'8883990205', N'abubucker.sed@gmail.com', 35000.0000, 205, 105)
GO
INSERT [dbo].[employee] ([ID], [NAME], [DOJ], [MOBILE], [EMAIL], [SALARY], [DESIGN], [DEPT]) VALUES (3, N'Mohamed Abubucker', CAST(N'2017-07-01T00:00:00.000' AS DateTime), N'9080471513', N'abubucker.sed@gmail.com', 35000.0000, 204, 105)
GO
INSERT [dbo].[employee] ([ID], [NAME], [DOJ], [MOBILE], [EMAIL], [SALARY], [DESIGN], [DEPT]) VALUES (4, N'Mohamed Musheer', CAST(N'2017-01-10T00:00:00.000' AS DateTime), N'9790179540', N'muchcud@gmail.com', 20000.0000, 205, 105)
GO
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([DEPT])
REFERENCES [dbo].[departments_master] ([DEPT_CODE])
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD FOREIGN KEY([DESIGN])
REFERENCES [dbo].[designations_master] ([DESGIN_ID])
GO
/****** Object:  StoredProcedure [dbo].[createEmployee]    Script Date: 10/29/2017 3:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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
END




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
GO
USE [master]
GO
ALTER DATABASE [EMPLOYEE] SET  READ_WRITE 
GO
