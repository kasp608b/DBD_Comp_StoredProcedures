
CREATE FUNCTION udf_getEmployeeProjects(@SSN NUMERIC(9,0))
RETURNS TABLE
AS
RETURN
SELECT Pnumber, Pname, Dname, Plocation, Hours
FROM Project
JOIN Department ON Project.DNum = Dnumber
JOIN Works_On ON Essn = @SSN AND Pnumber = Pno