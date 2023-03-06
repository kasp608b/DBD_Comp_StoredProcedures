--- usp_UpdateDepartmentName(DNumber, DName)
--- If the new name is not already is use,The DName is updated to the new value. Else, an SQLException is thrown.
CREATE OR ALTER PROCEDURE [dbo].[usp_UpdateDepartmentManager]
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


