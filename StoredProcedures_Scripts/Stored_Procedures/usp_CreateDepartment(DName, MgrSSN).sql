
--- usp_CreateDepartment(DName, MgrSSN)
--- In order to have the DNumber be auto-generated we used SQL management studio to add identity to the DNumber.
--- The department must be created with an auto-generated DNumber, and theMgrStartdate set to the current date.
--- The auto-generated DNumber should be returned by the procedure.
--- If the DName already exists, an SQLException must be thrown and the department is not created.
--- If the MgsSSN is already a department manager, an SQLException must bethrown and the department is not created.
CREATE or alter PROCEDURE usp_CreateDepartment
(
	@DName nvarchar(50),
	@MgrSSN numeric,
	@DepId int OUTPUT
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

	
	SET @DepId = SCOPE_IDENTITY();
	
	

END
GO
