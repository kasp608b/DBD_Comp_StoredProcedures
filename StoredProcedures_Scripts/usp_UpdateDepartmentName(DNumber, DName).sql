--- usp_UpdateDepartmentName(DNumber, DName)
--- If the new name is not already is use,The DName is updated to the new value. Else, an SQLException is thrown.
CREATE or alter PROCEDURE usp_UpdateDepartmentName
(
	@DNumber int,
	@DName varchar(50)
	
)
AS
BEGIN 
	SET NOCOUNT ON 

	IF EXISTS (SELECT 1 FROM Department WHERE DName = @DName)
		THROW 50001, 'Department Name already in use ', 1

	UPDATE Department SET DName = @DName WHERE DNumber = @DNumber;
	

END

GO 
