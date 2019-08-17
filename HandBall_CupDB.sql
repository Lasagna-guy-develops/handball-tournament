CREATE Database HandBallCup;

USE HandBallCup;


CREATE TABLE Category(
CategoryKey INT AUTO_INCREMENT,
CategoryName VARCHAR(40),
PRIMARY KEY (CategoryKey)
);

CREATE TABLE Club(
ClubKey INT AUTO_INCREMENT,
ClubName VARCHAR(60),
PRIMARY KEY(ClubKey)
);

CREATE TABLE Team(
TeamKey INT NOT NULL,
TeamName VARCHAR(60),
CategoryKey INT,
PRIMARY KEY(TeamKey),
FOREIGN KEY (CategoryKey) REFERENCES Category(CategoryKey)
);

CREATE TABLE Coach(
CoachKey INT NOT NULL,
UserName VARCHAR(50)NOT NULL,
PassHash VARCHAR(35)NOT NULL,
EPS VARCHAR(30),
FirstName VARCHAR(30),
LastName VARCHAR(70),
IDTipe Varchar (20),
ID VARCHAR(30),
DBirth DATE,
TeamKey INT,
FOREIGN KEY (TeamKey) REFERENCES Team(TeamKey)
);

CREATE TABLE Player(
PlayerKey INT NOT NUll AUTO_INCREMENT,
EPS VARCHAR(30) NOT NULL,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(70) NOT NULL,
IDType Varchar (20) NOT NULL,
ID VARCHAR(30) NOT NULL,
DBirth DATE,
TeamKey INT,
PRIMARY KEY(PlayerKey),
FOREIGN KEY  (TeamKey) REFERENCES Team(TeamKey)
);

CREATE TABLE Person(
PersonKey INT NOT NUll AUTO_INCREMENT,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(70) NOT NULL,
IDType Varchar (20) NOT NULL,
ID VARCHAR(30) NOT NULL,
PRIMARY KEY (PersonKey)
);


CREATE TABLE Match(
MatchKey INT NOT NULL AUTO_INCREMENT,
Team1Key INT,
Team2Key INT,
PRIMARY KEY(MatchKey),
FOREIGN KEY (Team1Key) REFERENCES Team(TeamKey),
FOREIGN KEY (Team2Key) REFERENCES Team(TeamKey)
);
