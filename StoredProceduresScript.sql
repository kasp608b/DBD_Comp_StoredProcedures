-----------------------------------------------------------------------------------------------------------------
--- This is the Script that contains all the alterations needed to implement the stored procedures.
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--- Triggers
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--- Functions
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--- Constraints
---
--- usp_CreateDepartment
--- In order to have the DNumber be auto-generated we used SQL management studio to add identity to the DNumber.
-----------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
--- Store Procedures

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

	UPDATE Department SET DName = @DName WHERE DNumber = @DNumber;
	

END

GO 
-----------------------------------------------------------------------------------------------------------------