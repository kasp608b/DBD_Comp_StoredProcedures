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
