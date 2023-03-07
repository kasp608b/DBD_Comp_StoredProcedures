--- Made a function named NumberOfEmployees(DNumber) to help with the implementation.
--- Return all departments (all attributes) together with an attribute named
--- ‘EmpCount’ stating the total number of employees for each department.
CREATE or alter PROCEDURE usp_GetAllDepartments
AS
BEGIN 
	SELECT DName, DNumber, MgrSSN, MgrStartDate , EmpCount
	FROM Department
END

GO