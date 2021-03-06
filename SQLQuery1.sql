CREATE DATABASE "Authorizationn"
ON PRIMARY(NAME = 'Authorizationn',  FILENAME = 'D:\Nizamova\DBAuthorizationn\Authorizationn.mdf', SIZE = 3072 KB, MAXSIZE = UNLIMITED, FILEGROWTH = 1024)
LOG ON (NAME = 'Authorizationn_log', FILENAME = 'D:\Nizamova\DBAuthorizationn\Authorizationn_log.ldf', SIZE = 1024 KB, MAXSIZE = 2048, FILEGROWTH = 10%)


CREATE TABLE Discipline
(CodeDiscipline INT IDENTITY NOT NULL CONSTRAINT PK_Discipline PRIMARY KEY,
Discipline VARCHAR (100) NOT NULL)

INSERT INTO Discipline VALUES ('??????????')
INSERT INTO Discipline VALUES ('?????????? ????')
INSERT INTO Discipline VALUES ('??????????? ????')
INSERT INTO Discipline VALUES ('?????????')
INSERT INTO Discipline VALUES ('?????????')

CREATE TABLE Roles
(CodeRole INT IDENTITY NOT NULL CONSTRAINT PK_Roles PRIMARY KEY,
[Role] VARCHAR(100) NOT NULL)

INSERT INTO Roles VALUES ('???????')
INSERT INTO Roles VALUES ('?????????????')
INSERT INTO Roles VALUES ('?????????????')

CREATE TABLE [Group]
(CodeGroup INT IDENTITY NOT NULL CONSTRAINT PK_Group PRIMARY KEY,
[Group] VARCHAR (10) UNIQUE NOT NULL)

INSERT INTO [Group] VALUES ('101')
INSERT INTO [Group] VALUES ('201')
INSERT INTO [Group] VALUES ('301')
INSERT INTO [Group] VALUES ('401')
INSERT INTO [Group] VALUES ('501')
INSERT INTO [Group] VALUES ('??? ??????')

CREATE TABLE Person
(CodePerson INT IDENTITY NOT NULL CONSTRAINT PK_Person PRIMARY KEY,
Family VARCHAR(100) NOT NULL,
[Name] VARCHAR(100) NOT NULL,
Patronimic VARCHAR(100) NOT NULL,
Birthday DATE NOT NULL,
Gender VARCHAR(10) NOT NULL,
Email VARCHAR(100) NOT NULL,
CodeGroup INT NOT NULL
CONSTRAINT FK_Group FOREIGN KEY (CodeGroup)
REFERENCES [Group]   (CodeGroup)
ON UPDATE CASCADE
ON DELETE CASCADE)

CREATE TABLE Users
(CodePerson INT NOT NULL CONSTRAINT PK_Users PRIMARY KEY,
LoginUser VARCHAR(100) NOT NULL,
[Password] VARCHAR(100) NOT NULL,
CodeRole INT NOT NULL
CONSTRAINT FK_Users FOREIGN KEY (CodePerson)
REFERENCES Person (CodePerson)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Roles FOREIGN KEY (CodeRole)
REFERENCES Roles (CodeRole)
ON UPDATE CASCADE
ON DELETE CASCADE)

CREATE TABLE Progress
(CodeProgress INT IDENTITY NOT NULL CONSTRAINT PK_Progress PRIMARY KEY,
CodePerson INT NOT NULL,
CodeDiscipline INT NOT NULL,
Grade INT NOT NULL,
DateGrade DATE NOT NULL
CONSTRAINT FK_Discipline_Progress FOREIGN KEY (CodeDiscipline)
REFERENCES Discipline (CodeDiscipline)
ON UPDATE CASCADE
ON DELETE CASCADE,
CONSTRAINT FK_Person_Progress FOREIGN KEY (CodePerson)
REFERENCES Person (CodePerson)
ON UPDATE CASCADE
ON DELETE CASCADE)

CREATE TABLE Session
(CodeSession INT IDENTITY NOT NULL CONSTRAINT PK_Session PRIMARY KEY,
CodePerson  INT NOT NULL,
DateSession DATETIME  NOT NULL,
Time VARCHAR (15) NOT NULL
CONSTRAINT FK_Session_Person FOREIGN KEY (CodePerson)
REFERENCES Person (CodePerson)
ON UPDATE CASCADE
ON DELETE CASCADE)


