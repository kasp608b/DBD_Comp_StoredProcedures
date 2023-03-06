USE [master]
GO

USE Company					
GO
-- Changed the Department schema to be identity.
-- The department must be created with an auto-generated DNumber, and theMgrStartdate set to the current date.
-- The auto-generated DNumber should be returned by the procedure.
-- If the DName already exists, an SQLException must be thrown and the department is not created.
-- If the MgsSSN is already a department manager, an SQLException must bethrown and the department is not created.
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

GO
CREATE or alter PROCEDURE usp_NumberOfEmployees
(
	@DNnumber int,
	@EmpCount INT OUTPUT
)
AS
BEGIN 
	SET NOCOUNT ON 
	SELECT @EmpCount = COUNT(*)
	FROM Employee e
		JOIN Department d ON e.Dno = d.DNumber
	WHERE DNumber = @DNnumber
	

END

GO

CREATE or alter PROCEDURE usp_GetDepartment
(
	@DNnumber int
)
AS
BEGIN 
	SET NOCOUNT ON 

	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNnumber)
		THROW 50001, 'Department dosent exist', 1

	DECLARE @EmpCount int;
	exec usp_NumberOfEmployees @DNnumber , @EmpCount OUTPUT

	SELECT DISTINCT DName, DNumber, MgrSSN, MgrStartDate , @EmpCount AS EmpCount
	FROM Department d
	JOIN Employee e ON d.DNumber = e.Dno
	WHERE DNumber = @DNnumber

END

GO