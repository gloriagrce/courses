--1 
create database AvLogs;
GO

--2 
use AvLogs
GO

--3
CREATE TABLE [dbo].[StateProvinceLog](
	[StateProvinceID] [int] NOT NULL,
	[StateProvinceCode] [nchar](3) NOT NULL,
	[CountryRegionCode] [nvarchar](3) NOT NULL,
	[IsOnlyStateProvinceFlag] [bit] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TerritoryID] [int] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ChangeType] [nchar](1) NULL,
	[ChangeDate] [datetime] NULL,
	[UserName] [nvarchar](30) NULL
) ON [PRIMARY]
GO

--4 
use AdventureWorks2017
go

--5
create trigger [stPersonLog]
on AdventureWorks2017.Person.StateProvince
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	declare @operation char(1)

	if exists(select * from inserted)
	BEGIN
		if exists(select * from deleted)
			set @operation = 'U'
		else
			set @operation = 'I'
	END
	ELSE
	 
		set @operation = 'D'
	insert into AvLogs.dbo.StateProvinceLog
	select StateProvinceID, 
		   StateProvinceCode,
		   CountryRegionCode, 
		   IsOnlyStateProvinceFlag,
		   Name, 
		   TerritoryID,
		   ModifiedDate, 
		   @operation,
		   getdate(),
		   user_name()  
		   from deleted
	
END
GO

--6
INSERT INTO AdventureWorks2017.Person.StateProvince(StateProvinceCode, CountryRegionCode, IsOnlyStateProvinceFlag, Name, TerritoryID, rowguid, ModifiedDate)
VALUES ('BA', 'UM', 0, 'Bailey', 1, NEWID(), GETDATE())
GO

UPDATE AdventureWorks2017.Person.StateProvince
SET Name = 'Buckey'
where StateProvinceCode = 'BA'
GO

DELETE from AdventureWorks2017.Person.StateProvince
where StateProvinceCode = 'BA'
GO

select * from AvLogs.dbo.StateProvinceLog
GO
--7 
use AvLogs
go

--8
create procedure procLogActivity 
@checkDate date,
@activeCount int output
as
BEGIN 