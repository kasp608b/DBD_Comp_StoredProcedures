USE [master]
GO
-----------------------------------------------------------------------------------------------------------------
--- This is the Script that contains all the alterations needed to implement the stored procedures.
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--- Constraints
-----------------------------------------------------------------------------------------------------------------
IF DB_ID('Company') IS NOT NULL     -- Fix name
BEGIN
	DROP DATABASE Company			-- Fix name
END

CREATE DATABASE Company			-- Fix name
GO

USE Company						-- Fix name
GO

CREATE TABLE Department(
	DName			nvarchar(50)	NULL,
	DNumber			int IDENTITY(1,1) NOT NULL,
	MgrSSN			numeric(9, 0)	NULL,
	MgrStartDate	datetime		NULL,
	CONSTRAINT PK_Department PRIMARY KEY (DNumber)
)
GO


CREATE TABLE [Dependent](
	Essn			numeric(9, 0)	NOT NULL,
	Dependent_Name	nvarchar(50)	NOT NULL,
	Sex				nchar(1)		NULL,
	BDate			datetime		NULL,
	Relationship	nvarchar(50)	NULL,
	CONSTRAINT PK_Dependent PRIMARY KEY (Essn, Dependent_Name)
) 
GO

CREATE TABLE Dept_Locations(
	DNUmber			int				NOT NULL,
	DLocation		nvarchar(50)	NOT NULL,
	CONSTRAINT PK_Dept_Locations PRIMARY KEY (DNUmber, DLocation)
) 
GO


CREATE TABLE Employee(
	FName			nvarchar(50)	NULL,
	Minit			char(1)			NULL,
	LName			nvarchar(50)	NULL,
	SSN				numeric(9, 0)	NOT NULL,
	BDate			datetime		NULL,
	Address			nvarchar(50)	NULL,
	Sex				char(1)			NULL,
	Salary			numeric(10, 2)	NULL,
	SuperSSN		numeric(9, 0)	NULL,
	Dno				int				NULL,
	CONSTRAINT PK_Employee PRIMARY KEY (SSN)
)
GO

CREATE TABLE Project
(
	PName			nvarchar(50)	NULL,
	PNumber			int				NOT NULL,
	PLocation		nvarchar(50)	NULL,
	DNum			int				NULL,
	CONSTRAINT PK_Project PRIMARY KEY (PNumber)
)
GO

CREATE TABLE Works_on
(
	Essn			numeric(9, 0)	NOT NULL,
	Pno				int				NOT NULL,
	Hours			float			NULL,
	CONSTRAINT PK_Works_on PRIMARY KEY (Essn, Pno)
) 
GO

set IDENTITY_INSERT Department ON

-- load table Department

INSERT INTO Department(DName, DNumber, MgrSSN, MgrStartDate) VALUES (N'Headquarters', 1, 888665555, N'1971-06-19')
INSERT INTO Department(DName, DNumber, MgrSSN, MgrStartDate) VALUES (N'Administration', 4, 123456789, N'1986-01-01')
INSERT INTO Department(DName, DNumber, MgrSSN, MgrStartDate) VALUES (N'Research', 5, 987654321, N'1978-05-22')

-- load table Dependent

INSERT INTO  [Dependent] (Essn, Dependent_Name, Sex, BDate, Relationship) VALUES (123456789, N'Alice', N'F', N'1978-12-31', N'Daughter')
INSERT INTO  [Dependent] (Essn, Dependent_Name, Sex, BDate, Relationship) VALUES (123456789, N'Elizabeth', N'F', N'1957-05-05', N'Spouse')
INSERT INTO  [Dependent] (Essn, Dependent_Name, Sex, BDate, Relationship) VALUES (123456789, N'Michael', N'M', N'1978-01-01', N'Son')
INSERT INTO  [Dependent] (Essn, Dependent_Name, Sex, BDate, Relationship) VALUES (333445555, N'Alice', N'F', N'1976-04-05', N'Daughter')
INSERT INTO  [Dependent] (Essn, Dependent_Name, Sex, BDate, Relationship) VALUES (333445555, N'Joy', N'F', N'1948-05-03', N'Spouse')
INSERT INTO  [Dependent] (Essn, Dependent_Name, Sex, BDate, Relationship) VALUES (333445555, N'Theodore', N'M', N'1973-10-25', N'Son')
INSERT INTO  [Dependent] (Essn, Dependent_Name, Sex, BDate, Relationship) VALUES (987654321, N'Abner', N'M', N'1932-02-29', N'Spouse')

-- load table Dept_Locations

INSERT INTO Dept_Locations (DNUmber, DLocation) VALUES (1, N'Houston')
INSERT INTO Dept_Locations (DNUmber, DLocation) VALUES (4, N'Stafford')
INSERT INTO Dept_Locations (DNUmber, DLocation) VALUES (5, N'Bellaire')
INSERT INTO Dept_Locations (DNUmber, DLocation) VALUES (5, N'Houston')
INSERT INTO Dept_Locations (DNUmber, DLocation) VALUES (5, N'Sugarland')

-- load table Employee

INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'John', N'B', N'Smith', 123456789, N'1955-01-09', N'731 Fondren, Houston, TX', N'M', 30000.00, 987654321, 5)
INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'Franklin', N'T', N'Wong', 333445555, N'1945-12-08', N'638 Voss, Houston, TX', N'M', 40000.00, 987654321, 5)
INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'Joyce', N'A', N'English', 453453453, N'1962-07-31', N'5631 Rice, Houston, TX', N'F', 25000.00, 987654321, 5)
INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'Ramesh', N'K', N'Narayan',666884444, N'1952-09-15', N'974 Fire Oak, Humble, TX', N'M', 38000.00, 987654321, 5)
INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'James', N'E', N'Borg', 888665555, N'1927-11-10', N'450 Stone, Houston, TX', N'M', 55000.00, NULL, 1)
INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'Jennifer', N'S', N'Wallace', 987654321, N'1931-06-20', N'291 Berry, Bellaire, TX', N'F', 36000.00, 123456789, 4)
INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'Ahmad', N'V', N'Jabbar', 987987987, N'1959-03-29', N'980 Dallas, Houston, TX', N'M', 25000.00, 123456789, 4)
INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'Alicia', N'J', N'Zelaya', 999887777, N'1958-07-19', N'3321 Castle, Spring, TX', N'F', 25000.00, 123456789, 4)

-- load table Project

INSERT INTO Project (PName, PNumber, PLocation, DNum) VALUES (N'ProductX', 1, N'Bellaire', 5)
INSERT INTO Project (PName, PNumber, PLocation, DNum) VALUES (N'ProductY', 2, N'Sugarland', 5)
INSERT INTO Project (PName, PNumber, PLocation, DNum) VALUES (N'ProductZ', 3, N'Houston', 5)
INSERT INTO Project (PName, PNumber, PLocation, DNum) VALUES (N'Computerization', 10, N'Stafford', 4)
INSERT INTO Project (PName, PNumber, PLocation, DNum) VALUES (N'Reorganization', 20, N'Houston', 1)
INSERT INTO Project (PName, PNumber, PLocation, DNum) VALUES (N'Newbenefits', 30, N'Stafford', 4)

-- load table Works_on
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (123456789, 1, 32)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (123456789, 2, 8)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (333445555, 2, 10)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (333445555, 3, 10)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (333445555, 10, 10)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (333445555, 20, 10)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (453453453, 1, 20)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (453453453, 2, 20)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (666884444, 3, 40)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (888665555, 20, NULL)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (987654321, 20, 15)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (987654321, 30, 20)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (987987987, 10, 35)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (987987987, 30, 5)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (999887777, 10, 10)
INSERT INTO Works_on (Essn, Pno, [Hours]) VALUES (999887777, 30, 30)

set IDENTITY_INSERT Department OFF


ALTER TABLE Department ADD CONSTRAINT FK_Department_Employee FOREIGN KEY(MgrSSN)
REFERENCES Employee(SSN)
GO

ALTER TABLE Dependent ADD CONSTRAINT FK_Dependent_Employee FOREIGN KEY(Essn)
REFERENCES Employee(SSN)
GO

ALTER TABLE Dept_Locations ADD CONSTRAINT FK_Dept_Locations_Department FOREIGN KEY(DNUmber)
REFERENCES Department(DNumber)
ON DELETE CASCADE
GO

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Department FOREIGN KEY(Dno)
REFERENCES Department(DNumber)
ON DELETE SET NULL
GO

ALTER TABLE Employee ADD CONSTRAINT FK_Employee_Employee FOREIGN KEY(SuperSSN)
REFERENCES Employee(SSN)
GO

ALTER TABLE Project ADD CONSTRAINT FK_Project_Department FOREIGN KEY(DNum)
REFERENCES Department(DNumber)
ON DELETE CASCADE
GO

ALTER TABLE Works_on ADD CONSTRAINT FK_Works_on_Employee FOREIGN KEY(Essn)
REFERENCES Employee(SSN)
GO

ALTER TABLE Works_on ADD CONSTRAINT FK_Works_on_Project FOREIGN KEY(Pno)
REFERENCES Project(PNumber)
ON DELETE CASCADE
GO

-----------------------------------------------------------------------------------------------------------------
--- Functions
-----------------------------------------------------------------------------------------------------------------
USE Company					
GO

--- function used in usp_GetDepartment and usp_GetDepartments to get the employee count
CREATE or alter FUNCTION NumberOfEmployees(@DNnumber int)
RETURNS INT
AS
BEGIN
DECLARE @EmpCount INT;

	SELECT @EmpCount = COUNT(*)
	FROM Employee e
		JOIN Department d ON e.Dno = d.DNumber
	WHERE DNumber = @DNnumber or @DNnumber IS NULL

return @EmpCount
END
GO

-----------------------------------------------------------------------------------------------------------------
--- Stored Procedures Pre EmpCount change
-----------------------------------------------------------------------------------------------------------------

--- usp_CreateDepartment(DName, MgrSSN)
--- In order to have the DNumber be auto-generated we used SQL management studio to add identity to the DNumber.
--- The department must be created with an auto-generated DNumber, and theMgrStartdate set to the current date.
--- The auto-generated DNumber should be returned by the procedure.
--- If the DName already exists, an SQLException must be thrown and the department is not created.
--- If the MgsSSN is already a department manager, an SQLException must bethrown and the department is not created.
CREATE or alter PROCEDURE usp_CreateDepartment
(
	@DName nvarchar(50),
	@MgrSSN numeric
)
AS
BEGIN 
    SET XACT_ABORT ON;

	IF EXISTS (SELECT 1 FROM Department WHERE DName = @DName)
		THROW 50001, 'Department Name already in use ', 1
    
	IF EXISTS (SELECT 1 FROM Department  WHERE MgrSSN = @MgrSSN)
		THROW 50001, 'MgsSSN is already a department manager', 1


    declare @theMgrStartdate datetime = GETDATE();
	INSERT INTO Department
	VALUES(@DName,@MgrSSN,@theMgrStartdate)

	return SCOPE_IDENTITY()
	

END
GO 
-----------------------------------------------------------------------------------------------------------------

-- Added ON DELETE CASCADE to Dept_Locations, Project, Works_on
-- Added ON DELETE SET NULL to Employee
-- if the department with DNumber exists, it is deleted.
-- All related tuples in the Dept_Locations relation is also deleted.
-- All related tuples in the Works_on relations is also deleted.
-- All employees in the Employee relation working in the deleted department should have the Dno attribute set to NULL.
CREATE or alter PROCEDURE usp_DeleteDepartment
(
	@DNnumber int
)
AS
BEGIN 
    SET XACT_ABORT ON;

	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNnumber)
		THROW 50001, 'Department dosent exist', 1
    
	DELETE FROM Department
	WHERE DNumber = @DNnumber
    
END
GO
-----------------------------------------------------------------------------------------------------------------

--- usp_UpdateDepartmentName(DNumber, DName)
--- If the new name is not already is use,The DName is updated to the new value. Else, an SQLException is thrown.
CREATE or alter PROCEDURE usp_UpdateDepartmentName
(
	@DNumber int,
	@DName varchar(50)
	
)
AS
BEGIN 

	SET XACT_ABORT ON;

	IF EXISTS (SELECT 1 FROM Department WHERE DName = @DName)
		THROW 50001, 'Department Name already in use ', 1

	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNumber)
		THROW 50002, 'Department does not exist ', 1

	UPDATE Department SET DName = @DName WHERE DNumber = @DNumber;
	

END

GO
-----------------------------------------------------------------------------------------------------------------

--- Made a function named NumberOfEmployees(DNumber) to help with the implementation.
--- Return all attributes of the department with the given DNumber together with an
--- attribute named ‘EmpCount’ stating the total number of employees of that department.
CREATE or alter PROCEDURE usp_GetDepartment
(
	@DNnumber int
)
AS
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNnumber)
		THROW 50001, 'Department dosent exist', 1

	SELECT DISTINCT DName, DNumber, MgrSSN, MgrStartDate , dbo.NumberOfEmployees(DNumber) AS EmpCount
	FROM Department d
	JOIN Employee e ON d.DNumber = e.Dno
	WHERE DNumber = @DNnumber

END

GO
-----------------------------------------------------------------------------------------------------------------

--- Made a function named NumberOfEmployees(DNumber) to help with the implementation.
--- Return all departments (all attributes) together with an attribute named
--- ‘EmpCount’ stating the total number of employees for each department.
CREATE or alter PROCEDURE usp_GetAllDepartments
AS
BEGIN 

	SELECT DISTINCT DName, DNumber, MgrSSN, MgrStartDate , dbo.NumberOfEmployees(DNumber) AS EmpCount
	FROM Department d
	JOIN Employee e ON d.DNumber = e.Dno
	ORDER BY DName

END

GO
-----------------------------------------------------------------------------------------------------------------

--- usp_UpdateDepartmentManager(DNumber, MgrSSN)
--- If the new MgrSSN is not already a manager,The MgrSSN is updated to the new value, and the MgrStartdate is set to the current date.
--- this department, and not being the manager, should have the SuperSSN attribute set to the new manager’s SSN
--- If the MgsSSN is already in use, an SQLException is thrown and no updating is done.
--- Manager should not be his own manager
CREATE OR ALTER PROCEDURE usp_UpdateDepartmentManager
(
	@DNumber int,
	@MgrSSN numeric(9, 0)
	
)
AS
BEGIN 

	SET XACT_ABORT ON;
	
	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNumber)
		THROW 50002, 'Department does not exist ', 1

	IF EXISTS (SELECT 1 FROM Department WHERE MgrSSN = @MgrSSN)
		THROW 50001, 'This Manager SSN is already already in use ', 1
	
	declare @MgrStartdate datetime = GETDATE();

	UPDATE Department SET MgrSSN = @MgrSSN, MgrStartdate = @MgrStartdate  WHERE DNumber = @DNumber;
	
	UPDATE Employee SET SuperSSN = @MgrSSN WHERE Dno =  @DNumber AND NOT SSN = @MgrSSN; 

END