USE [master]
GO

USE Company						-- Fix name
GO

Alter Table Department
Add DNumber_new Int Identity(1, 1)
Go

Alter Table Department Drop Column DNumber
Go

Exec sp_rename 'Department.Id_new', 'DNumber', 'Column'
