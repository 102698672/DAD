drop table if exists PlayerRegistration;
drop table if exists TeamEntry;
drop table if exists Club;
drop table if exists Season;
drop table if exists Player;

CREATE TABLE Player (
PlayerID INT NOT NULL, 
Lname NVARCHAR (100) NOT NULL,
FName NVARCHAR (100) NOT NULL, 
Phone NVARCHAR (50) ,
Primary Key (PlayerID)
);

INSERT INTO Player (
PlayerID, 
Fname, 
LName, 
Phone) 

Values 
(10001, 'Kevin', 'Crudd', 5551234),
(10002, 'John', 'Howard', 5552345), 
(10003, 'Julia', 'Gillard', 5553456),
(10004, 'Kim', 'Peasley', 5554567);

CREATE TABLE Club (
ClubName NVARCHAR (100), 
ContactName NVARCHAR (100),
Primary Key (ClubName)
);

INSERT INTO Club (ClubName, ContactName) 

Values 
('Mt Martha Basketball Club', 'Bob Jane'),
('Mt George Basketball Club', 'Johnald'),
('Mt Mountain Basketball Club', 'Jimothy'),
('Mt Mount Basketball Club', 'Jane Bob');

CREATE TABLE Season (
SeasonYear INT, 
SeasonName NVARCHAR (6), 
 
Primary Key (SeasonYear, SeasonName),
Check (SeasonName IN ('Winter', 'Summer'))
);

INSERT INTO Season (SeasonYear, SeasonName) 

Values 
(2018, 'Winter'),
(2018, 'Summer'),
(2019, 'Winter'),
(2019, 'Summer');

CREATE TABLE TeamEntry (
ClubName NVARCHAR (100), 
SeasonYear INT,
SeasonName NVARCHAR (6),
AgeGroup NVARCHAR (3), 
TeamNumber INT,

Primary Key (ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber),
Foreign Key (ClubName) References Club,
Foreign Key (SeasonYear, SeasonName) References Season
);

INSERT INTO TeamEntry (ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber)Values
('Mt Martha Basketball Club', 2018, 'Summer', 'U14', 1),
('Mt Martha Basketball Club', 2018, 'Summer', 'U14', 2),
('Mt Mountain Basketball Club', 2019, 'Summer', 'U16', 3),
('Mt Mount Basketball Club', 2019, 'Summer', 'U18', 4);

CREATE TABLE PlayerRegistration (
PlayerID INT, 
ClubName NVARCHAR (100),
SeasonYear INT,
SeasonName NVARCHAR (6),
AgeGroup NVARCHAR (3), 
TeamNumber INT,
DateRegistered DATE,

Primary Key (PlayerID, ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber, DateRegistered),
Foreign Key (ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber) References TeamEntry,
Foreign Key (PlayerID) References Player
);

INSERT INTO PlayerRegistration (PlayerID, ClubName, SeasonYear, SeasonName, AgeGroup, TeamNumber, DateRegistered)Values
(10002, 'Mt Martha Basketball Club', 2018,'Winter', 'U14', 1, '12/05/2018'),
(10003, 'Mt Martha Basketball Club', 2018,'Summer', 'U14', 2, '8/01/2018'),
(10001, 'Mt Mountain Basketball Club', 2019,'Winter', 'U16', 3, '12/04/2019'),
(10004, 'Mt Mount Basketball Club', 2019,'Summer', 'U18', 4, '15/05/2019');

SELECT * FROM PlayerRegistration