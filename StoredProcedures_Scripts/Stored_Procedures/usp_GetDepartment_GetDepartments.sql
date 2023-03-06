
GO
CREATE or alter PROCEDURE usp_NumberOfEmployees
(
	@DNnumber int,
	@EmpCount INT OUTPUT
)
AS
BEGIN 
	SELECT @EmpCount = COUNT(*)
	FROM Employee e
		JOIN Department d ON e.Dno = d.DNumber
	WHERE DNumber = @DNnumber or @DNnumber IS NULL
	

END

GO

CREATE or alter FUNCTION NumberOfEmployees(@DNnumber int)
RETURNS INT
AS
BEGIN
DECLARE @EmpCount INT;

	SELECT @EmpCount = COUNT(*)
	FROM Employee e
		JOIN Department d ON e.Dno = d.DNumber
	WHERE DNumber = @DNnumber or @DNnumber IS NULL

return @EmpCount
END

GO

CREATE or alter PROCEDURE usp_GetDepartment
(
	@DNnumber int
)
AS
BEGIN 

	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNnumber)
		THROW 50001, 'Department dosent exist', 1

	SELECT DISTINCT DName, DNumber, MgrSSN, MgrStartDate , dbo.NumberOfEmployees(DNumber) AS EmpCount
	FROM Department d
	JOIN Employee e ON d.DNumber = e.Dno
	WHERE DNumber = @DNnumber

END

GO


CREATE or alter PROCEDURE usp_GetDepartments
AS
BEGIN 

	SELECT DISTINCT DName, DNumber, MgrSSN, MgrStartDate , dbo.NumberOfEmployees(DNumber) AS EmpCount
	FROM Department d
	JOIN Employee e ON d.DNumber = e.Dno
	ORDER BY DName

END

GO