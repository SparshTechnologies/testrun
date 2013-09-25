/*
* Created By Shemeer NS 
* This Code is created for demo purpose and uploaded in Codeproject
* My Other Articles in codeproject - http://www.codeproject.com/script/Articles/MemberArticles.aspx?amid=3175840
* */
USE [master]
GO

/****** Object:  Database [EditableGridView]    Script Date: 07/05/2012 01:10:26 ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'EditableGridView')
DROP DATABASE [EditableGridView]
GO


/****** Object:  Database [EditableGridView]    Script Date: 07/05/2012 01:10:26 ******/
CREATE DATABASE [EditableGridView]
GO

USE [EditableGridView]
GO

/****** Object:  Table [dbo].[Employee]    Script Date: 07/05/2012 01:12:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Employee](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeCode] [varchar](max) NOT NULL,
	[EmployeeName] [varchar](max) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DepartmentName] [varchar](max) NOT NULL,
	[EmployeeGroup] [varchar](max) NOT NULL,
	[Email] [varchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

 /****** Object:  Employee    Script Date: 7/5/2012 1:26:50 AM ******/
SET NOCOUNT ON
INSERT INTO [Employee] ([EmployeeCode], [EmployeeName], [DepartmentId], [DepartmentName], [EmployeeGroup], [Email], [isActive])
VALUES ('113561', 'Shemeer', 3, 'IT', 'Admin','shemeer@xyz.com', 1)
INSERT INTO [Employee] ([EmployeeCode], [EmployeeName], [DepartmentId], [DepartmentName], [EmployeeGroup], [Email], [isActive])
VALUES ('763423', 'Jacob', 2, 'Marketinng', 'User','jacob@xyz.com', 1)
INSERT INTO [Employee] ([EmployeeCode], [EmployeeName], [DepartmentId], [DepartmentName], [EmployeeGroup], [Email], [isActive])
VALUES ('986766', 'Abhilash', 1,'Sales', 'User','abhi@xyz.com', 0)
INSERT INTO [Employee] ([EmployeeCode], [EmployeeName], [DepartmentId], [DepartmentName], [EmployeeGroup], [Email], [isActive])
VALUES ('864391', 'Aydin', 3, 'IT', 'Super User','aydin@xyz.com', 1)
INSERT INTO [Employee] ([EmployeeCode], [EmployeeName], [DepartmentId], [DepartmentName], [EmployeeGroup], [Email], [isActive])
VALUES ('233189', 'Dave', 1, 'IT', 'Admin','dave@xyz.com', 1)
