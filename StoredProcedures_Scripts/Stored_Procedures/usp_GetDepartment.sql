-----------------------------------------------------------------------------------------------------------------
--- Made a function named NumberOfEmployees(DNumber) to help with the implementation.
--- Return all attributes of the department with the given DNumber together with an
--- attribute named ‘EmpCount’ stating the total number of employees of that department.
CREATE or alter PROCEDURE usp_GetDepartment
(
	@DNumber int
)
AS
BEGIN 
	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNumber)
		THROW 50001, 'Department dosent exist', 1

	SELECT DISTINCT DName, DNumber, MgrSSN, MgrStartDate , EmpCount
	FROM Department d
	WHERE DNumber = @DNumber

END

GO