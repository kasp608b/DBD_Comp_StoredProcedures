
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