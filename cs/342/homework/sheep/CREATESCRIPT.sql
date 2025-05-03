---- Sheep homework 
--2
create database sheep;
GO

--3
use sheep
GO

--4 
create schema ActiveHerd
GO

-- 5 to 7 
create table [ActiveHerd].[sheep](
   idNumber int identity (1,1) NOT NULL , 
   SheepName varchar(30),
   BreedCategory char(1) NOT NULL,
   Gender char(1) NOT NULL,
   ShepherdId int NOT NULL, 
   CONSTRAINT [PK_sheepID] PRIMARY KEY ([idNumber])
);
GO

create table [ActiveHerd].[breed](
   BreedCategory char(1) NOT NULL, 
   BreedDescription varchar(30),
   CONSTRAINT [PK_breedID] PRIMARY KEY ([BreedCategory])
);
GO

create table [ActiveHerd].[sheepShots](
   idNumber int NOT NULL,
   ShotType char(1) NOT NULL, 
   ShotDate datetime NOT NULL,
   InjectionType char(1) NOT NULL,
   CONSTRAINT [PK_sheepShotsID] PRIMARY KEY ([idNumber], [ShotType], [ShotDate])
);
GO

create table [ActiveHerd].[shotList](
   ShotType char(1) NOT NULL,
   shotDescription varchar(30),
   dayCycle int NOT NULL,
   CONSTRAINT [PK_shotListID] PRIMARY KEY ([ShotType])
);
GO

create table [ActiveHerd].[injectionList](
   InjectionType char(1) NOT NULL,
   InjectionDescription varchar(30),
   CONSTRAINT [PK_InjectionListID] PRIMARY KEY ([InjectionType])
);
GO

create table [ActiveHerd].[shepherd](
   ShepherdID int identity (1,1) NOT NULL,
   LastName varchar(30) NOT NULL, 
   FirstName varchar(30) NOT NULL,
   ShepherdCertification bit NOT NULL,
   CONSTRAINT [PK_shepherdID] PRIMARY KEY ([ShepherdID])
);
GO

alter table [ActiveHerd].[sheep]
ADD FOREIGN KEY ([BreedCategory]) REFERENCES [ActiveHerd].breed([BreedCategory]),
    FOREIGN KEY ([ShepherdID]) REFERENCES [ActiveHerd].shepherd([ShepherdID])
go

alter table [ActiveHerd].[sheepShots]
ADD FOREIGN KEY ([idNumber]) REFERENCES [ActiveHerd].sheep([idNumber]),
    FOREIGN KEY ([ShotType]) REFERENCES [ActiveHerd].shotList([ShotType]),
	FOREIGN KEY ([InjectionType]) REFERENCES [ActiveHerd].injectionList([InjectionType])
go

-- SHEEP ONLY ASSIGNED TO ONE shepherd ????
alter table [ActiveHerd].[sheep]
ADD CHECK (BreedCategory != '' and Gender != '')
GO

alter table [ActiveHerd].[Shepherd]
ADD CHECK (ShepherdCertification != '');
GO

--8
INSERT INTO ActiveHerd.breed(BreedCategory, BreedDescription)
VALUES 
    ('d', 'dual-purpose'),
	('e', 'maternal'),
	('r', 'ram');
GO

INSERT INTO ActiveHerd.shepherd(LastName,FirstName,ShepherdCertification)
VALUES
    ('Luke', 'Bob', '1'),
	('Aida', 'Maria', '1'),
	('Josh', 'Hosh', '1');
GO


INSERT INTO ActiveHerd.sheep(SheepName, BreedCategory, Gender, ShepherdId)
VALUES 
    ('Bob', 'e', 'M', 1),
	('Maria', 'd', 'F', 2),
	('Hosh', 'r', 'M', 3)
GO

INSERT INTO ActiveHerd.injectionList(InjectionType, InjectionDescription)
VALUES
    ('O', 'Oral Injection'),
	('I', 'Injection'),
	('S', 'Subcutaneous'),
	('V', 'IV');
GO

INSERT INTO ActiveHerd.shotList(ShotType, shotDescription, dayCycle)
VALUES
    ('P', 'Parvo', 3),
	('C', 'CDT', 5),
	('R', 'Pasteurella', 8);
GO

-- 9 I have no clue on how to do this one with sub select
-- I cant insert any of the rows either because I don't know how to reference the ID from another table.

INSERT INTO ActiveHerd.sheepShots(idNumber, ShotType,ShotDate,InjectionType)
VALUES
    (1, 'P','February 20, 2022', 'O'),
	(1, 'C','February 20, 2022', 'O'),
	(1, 'R','February 20, 2022', 'O'),
	(2, 'P','February 20, 2022', 'O'),
	(2, 'C','February 20, 2022', 'O'),
	(2, 'R','February 20, 2022', 'O'),
	(3, 'P','February 20, 2022', 'O'),
	(3, 'C','February 20, 2022', 'O'),
	(3, 'R','February 20, 2022', 'O')

GO


--10
UPDATE ActiveHerd.sheepShots
SET ShotDate ='February 3, 2023'
Go

--11
select * from ActiveHerd.sheep
select * from ActiveHerd.breed
select * from ActiveHerd.injectionList
select * from ActiveHerd.shotList
select * from ActiveHerd.sheepShots
select * from ActiveHerd.shepherd
Go

--12 there is a total of 3 rows deleted
delete ActiveHerd.sheep;
GO

--13 it worked

--14 
delete ActiveHerd.shepherd;
GO

--15
--16
drop table ActiveHerd.breed,
          ActiveHerd.injectionList,
		  ActiveHerd.shotList,
		  ActiveHerd.shepherd,
		  ActiveHerd.sheep,
		  ActiveHerd.sheepShots

--17
drop database sheep