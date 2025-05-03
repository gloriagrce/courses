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
   idNumber int identity (1,1) NOT NULL,
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

alter table [ActiveHerd].[sheep]
ADD CHECK (BreedCategory != '' and Gender != ''),
    CHECK (ShepherdId = 1);
GO

alter table [ActiveHerd].[Shepherd]
ADD CHECK (ShepherdId != '');
GO

--8
INSERT INTO sheep
VALUES 
    (1, 'Bob', 'Dorper', 'male', 1),
	(2, 'Maria', 'Merino', 'female',2),
	(3, 'Hosh', 'Ladoum', '',3);