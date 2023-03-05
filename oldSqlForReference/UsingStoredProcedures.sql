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