--- function used in usp_GetDepartment and usp_GetDepartments to get the employee count
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