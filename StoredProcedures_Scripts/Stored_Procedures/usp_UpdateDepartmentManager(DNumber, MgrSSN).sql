--- usp_UpdateDepartmentManager(DNumber, MgrSSN)
--- If the new MgrSSN is not already a manager,The MgrSSN is updated to the new value, and the MgrStartdate is set to the current date.
--- this department, and not being the manager, should have the SuperSSN attribute set to the new manager’s SSN
--- If the MgsSSN is already in use, an SQLException is thrown and no updating is done.
--- Manager should not be his own manager
CREATE OR ALTER PROCEDURE usp_UpdateDepartmentManager
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
