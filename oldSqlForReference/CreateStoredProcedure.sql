CREATE or alter PROCEDURE USP_UpdateProjectName
(
	@PNumber INT, 
	@PName NVARCHAR(50)
)
AS
BEGIN 
	SET NOCOUNT ON 

	IF EXISTS (SELECT 1 FROM Project WHERE PName = @PName)
		THROW 50001, 'Project Name already in use ', 1
	
	UPDATE Project SET PName = @PName WHERE PNumber = @PNumber;
END

GO

CREATE or alter PROCEDURE usp_getEmployeeProjects
(
	@Essn numeric(9, 0)
)
AS
BEGIN 
	SET NOCOUNT ON 
	
	IF @Essn IS NULL
	SELECT PNumber, PName, DName PLocation, sum(Hours) AS Hours
	FROM Project p
		JOIN Department d ON p.DNum = d.DNumber
		JOIN Works_on w ON p.PNumber = w.Pno
	WHERE w.Essn  = @Essn or @Essn IS NULL
	GROUP BY PNumber, PName , DName, PLocation

END

GO
CREATE or alter PROCEDURE usp_NumberOfEmployees
(
	@Dname nvarchar(50),
	@EmpCount INT OUTPUT
)
AS
BEGIN 
	SET NOCOUNT ON 
	SELECT @EmpCount = COUNT(*)
	FROM Employee e
		JOIN Department d ON e.Dno = d.DNumber
	WHERE DName LIKE '%' + @Dname + '%'
	

END
GO
CREATE or alter PROCEDURE usp_CreateProject
(
	@Pname nvarchar(50),
	@PLocation nvarchar(50),
	@DNname int
	
)
AS
BEGIN 
	SET NOCOUNT ON 

	IF EXISTS (SELECT 1 FROM Project WHERE PName = @PName)
		THROW 50001, 'Project Name already in use ', 1

	INSERT INTO Project
	VALUES(@Pname,@PLocation,@DNname)

	return SCOPE_IDENTITY()
	

END

GO 
CREATE FUNCTION udf_getAge(@birthDate DATE) 
RETURNS int
AS
BEGIN DECLARE @today DATE = getDate();
DECLARE @age INT = DateDiff(YEAR, @birthDate, @today);
IF MONTH(@birthDate) > MONTH(@today) OR
	(MONTH(@birthDate) = MONTH(@today) AND
	DAY(@birthDate) > DAY(@today))
	BEGIN 
	SET @age = @age - 1
	END
	RETURN @age
END

GO

CREATE FUNCTION udf_getDepartmentEmployees(@Dname nvarchar(50))
RETURNS TABLE
AS
RETURN
SELECT FName, LName
FROM Employee
	JOIN Department ON Employee.Dno = Department.DNumber
WHERE DName LIKE '%' + @Dname + '%'

go

