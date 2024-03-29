
USE HandBallCup;


CREATE TABLE Category(
CategoryKey INT AUTO_INCREMENT,
CategoryName VARCHAR(40),
PRIMARY KEY (CategoryKey),
DESCRIPTION VARCHAR(100)
);


CREATE TABLE IDType(
    IDTypeKey INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDType VARCHAR(40)
);


CREATE TABLE Coach(
CoachKey INT NOT NULL AUTO_INCREMENT,
UserName VARCHAR(50)NOT NULL,
PassHash VARCHAR(64)NOT NULL,
EPS VARCHAR(30),
FirstName VARCHAR(30),
LastName VARCHAR(70),
IDType INT,
ID VARCHAR(30),
ClubName VARCHAR(70),
FOREIGN KEY (IDType) REFERENCES IDType(IDTypeKey),
Primary KEY (CoachKey)
);

CREATE TABLE Team(
TeamKey INT NOT NULL AUTO_INCREMENT,
TeamName VARCHAR(60),
CategoryKey INT,
CoachKey INT,
PRIMARY KEY(TeamKey),
FOREIGN KEY (CategoryKey) REFERENCES Category(CategoryKey),
FOREIGN KEY(CoachKey) REFERENCES Coach(CoachKey)
);



CREATE TABLE Player(
PlayerKey INT NOT NUll AUTO_INCREMENT,
EPS VARCHAR(30) NOT NULL,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(70) NOT NULL,
IDType INT NOT NULL,
ID VARCHAR(30) NOT NULL,
DBirth DATE NOT NULL,
TeamKey INT NOT NULL,
PictureURL VARCHAR(70),
PRIMARY KEY(PlayerKey),
FOREIGN KEY (IDType) REFERENCES IDType(IDTypeKey),
FOREIGN KEY  (TeamKey) REFERENCES Team(TeamKey)
);

CREATE TABLE Person(
PersonKey INT NOT NUll AUTO_INCREMENT,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(70) NOT NULL,
IDType INT NOT NULL,
ID VARCHAR(45) NOT NULL,
FOREIGN KEY (IDType) REFERENCES IDType(IDTypeKey),
PRIMARY KEY (PersonKey)
);

CREATE TABLE Game(
GameKey INT NOT NULL AUTO_INCREMENT,
GameDate DATE,
TeamOneKey INT,
TeamTwoKey INT,
PRIMARY KEY(GameKey),
FOREIGN KEY(TeamOneKey) REFERENCES Team(TeamKey),
FOREIGN KEY(TeamTwoKey) REFERENCES Team(TeamKey)
);

CREATE TABLE Goal(
GoalKey INT NOT NULL AUTO_INCREMENT,
GameKey INT,
PlayerKey INT,
PRIMARY KEY(GoalKey),
FOREIGN KEY(PlayerKey) REFERENCES Player(PlayerKey),
FOREIGN KEY(GameKey) REFERENCES Game(GameKey)
);

CREATE TABLE Assistant(
    AssistantKey INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(70) NOT NULL,
    ID VARCHAR(30) NOT NULL,
    IDType INT,
    CoachKey INT NOT NULL,
    FOREIGN KEY (IDType) REFERENCES IDType(IDTypeKey),
    FOREIGN KEY (CoachKey) REFERENCES Coach(CoachKey)

);


INSERT INTO Category(CategoryName)
VALUES("Infantil"),
("Cadetes Masculino"),
("Cadetes Femenino");

INSERT INTO IDType(IDType)
VALUES("Cédula de ciudadanía"),
("Cédula de extranjería"),
("Pasaporte"),
("Tarjeta Identidad"),
("Registro civil");

INSERT INTO Coach(UserName, PassHash)
VALUES("admin", "ac9689e2272427085e35b9d3e3e8bed88cb3434828b43b86fc0596cad4c6e270");

UPDATE Coach SET CoachKey = 0 WHERE UserName like "admin";


