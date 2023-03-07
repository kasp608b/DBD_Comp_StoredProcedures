begin try
EXEC USP_UpdateProjectName 2, 'Productyy'
end try 
begin catch 
	print 'unable ro update project name'
	print ERROR_MESSAGE()
end catch

SELECT * FROM Project

go
BEGIN
DECLARE @count int;
EXEC usp_NumberOfEmployees 'Admin', @count OUTPUT;
PRINT '#Employees = ' + STR(@count);
END


go
BEGIN
DECLARE @pid int;
EXEC @pid = usp_CreateProject 'testproject','VARDE',1   ;
PRINT @pid;
END

go

ALTER TABLE Employee ADD Age AS dbo.udf_getAge(Bdate)

go
BEGIN
DECLARE @DNumber int;
EXEC @DNumber = usp_CreateDepartment 'testdepartment2',987987987 ;
PRINT @DNumber;
END

go

INSERT INTO Employee (FName, Minit, LName, SSN, BDate, Address, Sex, Salary, SuperSSN, Dno) VALUES (N'TEST', N'E', N'Borg', 1254, N'1927-11-10', N'450 Stone, Houston, TX', N'M', 55000.00, NULL, 1)

go
BEGIN
EXEC usp_DeleteDepartment 5 ;

END

go

BEGIN
EXEC usp_GetDepartment 4 ;

END

BEGIN
EXEC usp_GetAllDepartments;

END