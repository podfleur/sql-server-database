--USE [master]
--DROP DATABASE IF EXISTS [team-builder]

--CREATE DATABASE [team-builder]
USE [team-builder]
CREATE TABLE [personne] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nom] varchar(255) NOT NULL,
  [prenom] varchar(255) NOT NULL
)
GO

CREATE TABLE [equipe] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nom] varchar(255) NOT NULL,
  [projet] varchar(255) NOT NULL,
  [personne_id] int
)
GO

CREATE TABLE [equipe_has_personne] (
  [personne_id] int,
  [equipe_id] int,
  PRIMARY KEY ([personne_id], [equipe_id])
)
GO

ALTER TABLE [equipe] ADD FOREIGN KEY ([personne_id]) REFERENCES [personne] ([id])
GO
ALTER TABLE [equipe_has_personne] ADD FOREIGN KEY ([equipe_id]) REFERENCES [equipe] ([id])
GO
ALTER TABLE [equipe_has_personne] ADD FOREIGN KEY ([personne_id]) REFERENCES [personne] ([id])
GO
/*
INSERT INTO [equipe] ([nom],[projet],[personne_id]) VALUES ('Team A','Projet site internet Mairie',1)
INSERT INTO [equipe] ([nom],[projet],[personne_id]) VALUES ('Team B','Projet CRM',4)
INSERT INTO [equipe] ([nom],[projet],[personne_id]) VALUES ('Team C','Projet ERP',7)

INSERT INTO [personne] ([prenom],[nom]) VALUES ('Brad','Pitt')
INSERT INTO [personne] ([prenom],[nom]) VALUES ('Bruce','Willis')
INSERT INTO [personne] ([prenom],[nom]) VALUES ('Nicolas','Cage')

INSERT INTO [personne] ([prenom],[nom]) VALUES ('Angelina','Jolie')
INSERT INTO [personne] ([prenom],[nom]) VALUES ('Tom','Cruise')
INSERT INTO [personne] ([prenom],[nom]) VALUES ('Tom','Hanks')

INSERT INTO [personne] ([prenom],[nom]) VALUES ('Bob','Jolie')
INSERT INTO [personne] ([prenom],[nom]) VALUES ('Johnny','Cash')
INSERT INTO [personne] ([prenom],[nom]) VALUES ('Jimmy','Hendrix')

INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (1,1)
INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (2,1)
INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (3,1)

INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (4,2)
INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (5,2)
INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (6,2)

INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (7,3)
INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (8,3)
INSERT INTO [equipe_has_personne] ([personne_id],[equipe_id]) VALUES (9,3)
*/
SELECT p.* FROM personne p
JOIN equipe_has_personne ep ON p.id = ep.personne_id
WHERE equipe_id = 1

SELECT p.*
FROM personne p
JOIN equipe_has_personne ep ON p.id = ep.personne_id
ORDER BY ep.equipe_id