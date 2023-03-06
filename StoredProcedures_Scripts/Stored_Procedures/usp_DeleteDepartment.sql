--- Added ON DELETE CASCADE to Dept_Locations, Project, Works_on
--- Added ON DELETE SET NULL to Employee
--- if the department with DNumber exists, it is deleted.
--- All related tuples in the Dept_Locations relation is also deleted.
--- All related tuples in the Works_on relations is also deleted.
--- All employees in the Employee relation working in the deleted department should have the Dno attribute set to NULL.
CREATE or alter PROCEDURE usp_DeleteDepartment
(
	@DNnumber int
)
AS
BEGIN 
    SET XACT_ABORT ON;

	IF NOT EXISTS (SELECT 1 FROM Department WHERE DNumber = @DNnumber)
		THROW 50001, 'Department dosent exist', 1
    
	DELETE FROM Department
	WHERE DNumber = @DNnumber
    
END

GO