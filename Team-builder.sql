--USE [master]
--DROP DATABASE IF EXISTS [team-builder]

--CREATE DATABASE [team-builder]
USE [team-builder]
CREATE TABLE [personne] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [team_id] int,
  [role] varchar(15),
  [prenom] varchar(15),
  [nom] varchar(15)
)
GO

CREATE TABLE [team] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [nom] varchar(10),
  [role] varchar(50)
)
GO

ALTER TABLE [personne] ADD FOREIGN KEY ([team_id]) REFERENCES [team] ([id])
GO
/*
INSERT INTO [team] ([nom],[role]) VALUES ('Team A','Projet site internet Mairie')
INSERT INTO [team] ([nom],[role]) VALUES ('Team B','Projet CRM')
INSERT INTO [team] ([nom],[role]) VALUES ('Team C','Projet ERP')

INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (1,'chef','Brad','Pitt')
INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (1,'designer','Bruce','Willis')
INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (1,'designer','Nicolas','Cage')

INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (2,'chef','Angelina','Jolie')
INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (2,'designer','Tom','Cruise')
INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (2,'designer','Tom','Hanks')

INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (3,'chef','Bob','Jolie')
INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (3,'designer','Johnny','Cash')
INSERT INTO [personne] ([team_id],[role],[prenom],[nom]) VALUES (3,'designer','Jimmy','Hendrix')
*/
SELECT * FROM [personne] INNER JOIN [team] 
ON [personne].[team_id] = [team].[id]
WHERE [team_id] = 1

SELECT * FROM [team] INNER JOIN [personne]
ON [team].[id] = [personne].[team_id]
ORDER BY [team_id] ASC
