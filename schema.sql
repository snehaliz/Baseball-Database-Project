/* CREATE DATABASE IF NOT CREATED */
CREATE DATABASE IF NOT EXISTS allstarfull;
USE allstarfull;

SET NAMES utf8 ;
SET character_set_client = utf8mb4;

/* DROP TABLES IF EXIST */
DROP TABLE IF EXISTS seriespost;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS pitchingpost;
DROP TABLE IF EXISTS pitching;
DROP TABLE IF EXISTS managershalf;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS homegames;
DROP TABLE IF EXISTS parks;
DROP TABLE IF EXISTS halloffame;
DROP TABLE IF EXISTS fieldingpost;
DROP TABLE IF EXISTS fieldingofsplit;
DROP TABLE IF EXISTS fieldingof;
DROP TABLE IF EXISTS fielding;
DROP TABLE IF EXISTS collegeplaying;
DROP TABLE IF EXISTS schools;
DROP TABLE IF EXISTS battingpost;
DROP TABLE IF EXISTS batting;
DROP TABLE IF EXISTS awardsshareplayers;
DROP TABLE IF EXISTS awardssharemanagers;
DROP TABLE IF EXISTS awardsplayers;
DROP TABLE IF EXISTS awardsmanagers;
DROP TABLE IF EXISTS appearances;
DROP TABLE IF EXISTS allstarfull;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS teamshalf;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS teamsfranchises;


/* CREATE TABLES */
CREATE TABLE teamsfranchises (
  franchID varchar(3) NOT NULL,
  franchName varchar(50) DEFAULT NULL,
  active varchar(2) DEFAULT NULL,
  NAassoc varchar(3) DEFAULT NULL,
  PRIMARY KEY (franchID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE teams (
  ID INT NOT NULL AUTO_INCREMENT,
  yearID smallint(6) NOT NULL,
  lgID char(2) DEFAULT NULL,
  teamID char(3) NOT NULL,
  franchID varchar(3) DEFAULT NULL,
  divID char(1) DEFAULT NULL,
  Rank smallint(6) DEFAULT NULL,
  G smallint(6) DEFAULT NULL,
  Ghome smallint(6) DEFAULT NULL,
  W smallint(6) DEFAULT NULL,
  L smallint(6) DEFAULT NULL,
  DivWin varchar(1) DEFAULT NULL,
  WCWin varchar(1) DEFAULT NULL,
  LgWin varchar(1) DEFAULT NULL,
  WSWin varchar(1) DEFAULT NULL,
  R smallint(6) DEFAULT NULL,
  AB smallint(6) DEFAULT NULL,
  H smallint(6) DEFAULT NULL,
  2B smallint(6) DEFAULT NULL,
  3B smallint(6) DEFAULT NULL,
  HR smallint(6) DEFAULT NULL,
  BB smallint(6) DEFAULT NULL,
  SO smallint(6) DEFAULT NULL,
  SB smallint(6) DEFAULT NULL,
  CS smallint(6) DEFAULT NULL,
  HBP smallint(6) DEFAULT NULL,
  SF smallint(6) DEFAULT NULL,
  RA smallint(6) DEFAULT NULL,
  ER smallint(6) DEFAULT NULL,
  ERA double DEFAULT NULL,
  CG smallint(6) DEFAULT NULL,
  SHO smallint(6) DEFAULT NULL,
  SV smallint(6) DEFAULT NULL,
  IPouts int(11) DEFAULT NULL,
  HA smallint(6) DEFAULT NULL,
  HRA smallint(6) DEFAULT NULL,
  BBA smallint(6) DEFAULT NULL,
  SOA smallint(6) DEFAULT NULL,
  E int(11) DEFAULT NULL,
  DP int(11) DEFAULT NULL,
  FP double DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  park varchar(255) DEFAULT NULL,
  attendance int(11) DEFAULT NULL,
  BPF int(11) DEFAULT NULL,
  PPF int(11) DEFAULT NULL,
  teamIDBR varchar(3) DEFAULT NULL,
  teamIDlahman45 varchar(3) DEFAULT NULL,
  teamIDretro varchar(3) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE teamshalf (
  ID INT NOT NULL AUTO_INCREMENT,
  yearID smallint(6) NOT NULL,
  lgID char(2) NOT NULL,
  teamID char(3) NOT NULL,
  Half varchar(1) NOT NULL,
  divID char(1) DEFAULT NULL,
  DivWin varchar(1) DEFAULT NULL,
  rank smallint(6) DEFAULT NULL,
  G smallint(6) DEFAULT NULL,
  W smallint(6) DEFAULT NULL,
  L smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE people (
  playerID varchar(9) NOT NULL,
  birthYear int(11) DEFAULT NULL,
  birthMonth int(11) DEFAULT NULL,
  birthDay int(11) DEFAULT NULL,
  birthCountry varchar(255) DEFAULT NULL,
  birthState varchar(255) DEFAULT NULL,
  birthCity varchar(255) DEFAULT NULL,
  deathYear int(11) DEFAULT NULL,
  deathMonth int(11) DEFAULT NULL,
  deathDay int(11) DEFAULT NULL,
  deathCountry varchar(255) DEFAULT NULL,
  deathState varchar(255) DEFAULT NULL,
  deathCity varchar(255) DEFAULT NULL,
  nameFirst varchar(255) DEFAULT NULL,
  nameLast varchar(255) DEFAULT NULL,
  nameGiven varchar(255) DEFAULT NULL,
  weight int(11) DEFAULT NULL,
  height int(11) DEFAULT NULL,
  bats varchar(255) DEFAULT NULL,
  throws varchar(255) DEFAULT NULL,
  debut varchar(255) DEFAULT NULL,
  finalGame varchar(255) DEFAULT NULL,
  retroID varchar(255) DEFAULT NULL,
  bbrefID varchar(255) DEFAULT NULL,
  birth_date date DEFAULT NULL,
  debut_date date DEFAULT NULL,
  finalgame_date date DEFAULT NULL,
  death_date date DEFAULT NULL,
  PRIMARY KEY (playerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE allstarfull (
  ID INT NOT NULL AUTO_INCREMENT,
  playerID varchar(9) NOT NULL,
  yearID smallint(6),
  gameNum smallint(6) NOT NULL,
  gameID varchar(12) DEFAULT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  GP smallint(6) DEFAULT NULL,
  startingPos smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE appearances (
  ID INT NOT NULL AUTO_INCREMENT, 
  yearID smallint(6) NOT NULL,
  teamID char(3) NOT NULL,
  lgID char(2) DEFAULT NULL,
  playerID varchar(9) NOT NULL,
  G_all smallint(6) DEFAULT NULL,
  GS smallint(6) DEFAULT NULL,
  G_batting smallint(6) DEFAULT NULL,
  G_defense smallint(6) DEFAULT NULL,
  G_p smallint(6) DEFAULT NULL,
  G_c smallint(6) DEFAULT NULL,
  G_1b smallint(6) DEFAULT NULL,
  G_2b smallint(6) DEFAULT NULL,
  G_3b smallint(6) DEFAULT NULL,
  G_ss smallint(6) DEFAULT NULL,
  G_lf smallint(6) DEFAULT NULL,
  G_cf smallint(6) DEFAULT NULL,
  G_rf smallint(6) DEFAULT NULL,
  G_of smallint(6) DEFAULT NULL,
  G_dh smallint(6) DEFAULT NULL,
  G_ph smallint(6) DEFAULT NULL,
  G_pr smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE awardsmanagers (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(10) NOT NULL,
  awardID varchar(75) NOT NULL,
  yearID smallint(6) NOT NULL,
  lgID char(2) NOT NULL,
  tie varchar(1) DEFAULT NULL,
  notes varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE awardsplayers (
  ID INT NOT NULL AUTO_INCREMENT,
  playerID varchar(9) NOT NULL,
  awardID varchar(255) NOT NULL,
  yearID smallint(6) NOT NULL,
  lgID char(2),
  tie varchar(1) DEFAULT NULL,
  notes varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE awardssharemanagers (
  ID INT NOT NULL AUTO_INCREMENT,
  awardID varchar(25) NOT NULL,
  yearID smallint(6) NOT NULL,
  lgID char(2) NOT NULL,
  playerID varchar(10) NOT NULL,
  pointsWon smallint(6) DEFAULT NULL,
  pointsMax smallint(6) DEFAULT NULL,
  votesFirst smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE awardsshareplayers (
  ID INT NOT NULL AUTO_INCREMENT,
  awardID varchar(25) NOT NULL,
  yearID smallint(6) NOT NULL,
  lgID char(2) NOT NULL,
  playerID varchar(9) NOT NULL,
  pointsWon double DEFAULT NULL,
  pointsMax smallint(6) DEFAULT NULL,
  votesFirst double DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE batting (
  ID INT NOT NULL AUTO_INCREMENT,
  playerID varchar(9) NOT NULL,
  yearID smallint(6) NOT NULL,
  stint smallint(6) NOT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  G smallint(6) DEFAULT NULL,
  G_batting smallint(6) DEFAULT NULL,
  AB smallint(6) DEFAULT NULL,
  R smallint(6) DEFAULT NULL,
  H smallint(6) DEFAULT NULL,
  2B smallint(6) DEFAULT NULL,
  3B smallint(6) DEFAULT NULL,
  HR smallint(6) DEFAULT NULL,
  RBI smallint(6) DEFAULT NULL,
  SB smallint(6) DEFAULT NULL,
  CS smallint(6) DEFAULT NULL,
  BB smallint(6) DEFAULT NULL,
  SO smallint(6) DEFAULT NULL,
  IBB smallint(6) DEFAULT NULL,
  HBP smallint(6) DEFAULT NULL,
  SH smallint(6) DEFAULT NULL,
  SF smallint(6) DEFAULT NULL,
  GIDP smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE battingpost (
  ID INT NOT NULL AUTO_INCREMENT, 
  yearID smallint(6) NOT NULL,
  round varchar(10) NOT NULL,
  playerID varchar(9) NOT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  G smallint(6) DEFAULT NULL,
  AB smallint(6) DEFAULT NULL,
  R smallint(6) DEFAULT NULL,
  H smallint(6) DEFAULT NULL,
  2B smallint(6) DEFAULT NULL,
  3B smallint(6) DEFAULT NULL,
  HR smallint(6) DEFAULT NULL,
  RBI smallint(6) DEFAULT NULL,
  SB smallint(6) DEFAULT NULL,
  CS smallint(6) DEFAULT NULL,
  BB smallint(6) DEFAULT NULL,
  SO smallint(6) DEFAULT NULL,
  IBB smallint(6) DEFAULT NULL,
  HBP smallint(6) DEFAULT NULL,
  SH smallint(6) DEFAULT NULL,
  SF smallint(6) DEFAULT NULL,
  GIDP smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID),
  UNIQUE KEY (yearID,round,playerID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE schools (
  schoolID varchar(15) NOT NULL,
  name_full varchar(255) DEFAULT NULL,
  city varchar(55) DEFAULT NULL,
  state varchar(55) DEFAULT NULL,
  country varchar(55) DEFAULT NULL,
  PRIMARY KEY (schoolID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE collegeplaying (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(9) NOT NULL,
  schoolID varchar(15) DEFAULT NULL,
  yearID smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE fielding (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(9) NOT NULL,
  yearID smallint(6) NOT NULL,
  stint smallint(6) NOT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  POS varchar(2) NOT NULL,
  G smallint(6) DEFAULT NULL,
  GS smallint(6) DEFAULT NULL,
  InnOuts smallint(6) DEFAULT NULL,
  PO smallint(6) DEFAULT NULL,
  A smallint(6) DEFAULT NULL,
  E smallint(6) DEFAULT NULL,
  DP smallint(6) DEFAULT NULL,
  PB smallint(6) DEFAULT NULL,
  WP smallint(6) DEFAULT NULL,
  SB smallint(6) DEFAULT NULL,
  CS smallint(6) DEFAULT NULL,
  ZR double DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE fieldingof (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(9) NOT NULL,
  yearID smallint(6) NOT NULL,
  stint smallint(6) NOT NULL,
  Glf smallint(6) DEFAULT NULL,
  Gcf smallint(6) DEFAULT NULL,
  Grf smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE fieldingofsplit (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(9) NOT NULL,
  yearID smallint(6) NOT NULL,
  stint smallint(6) NOT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  POS varchar(2) NOT NULL,
  G smallint(6) DEFAULT NULL,
  GS smallint(6) DEFAULT NULL,
  InnOuts smallint(6) DEFAULT NULL,
  PO smallint(6) DEFAULT NULL,
  A smallint(6) DEFAULT NULL,
  E smallint(6) DEFAULT NULL,
  DP smallint(6) DEFAULT NULL,
  PB smallint(6) DEFAULT NULL,
  WP smallint(6) DEFAULT NULL,
  SB smallint(6) DEFAULT NULL,
  CS smallint(6) DEFAULT NULL,
  ZR double DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE fieldingpost (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(9) NOT NULL,
  yearID smallint(6) NOT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  round varchar(10) NOT NULL,
  POS varchar(2) NOT NULL,
  G smallint(6) DEFAULT NULL,
  GS smallint(6) DEFAULT NULL,
  InnOuts smallint(6) DEFAULT NULL,
  PO smallint(6) DEFAULT NULL,
  A smallint(6) DEFAULT NULL,
  E smallint(6) DEFAULT NULL,
  DP smallint(6) DEFAULT NULL,
  TP smallint(6) DEFAULT NULL,
  PB smallint(6) DEFAULT NULL,
  SB smallint(6) DEFAULT NULL,
  CS smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE halloffame (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(10) NOT NULL,
  yearid smallint(6) NOT NULL,
  votedBy varchar(64) NOT NULL,
  ballots smallint(6) DEFAULT NULL,
  needed smallint(6) DEFAULT NULL,
  votes smallint(6) DEFAULT NULL,
  inducted varchar(1) DEFAULT NULL,
  category varchar(20) DEFAULT NULL,
  needed_note varchar(25) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE parks (
  ID INT NOT NULL AUTO_INCREMENT, 
  parkalias varchar(255) DEFAULT NULL,
  parkkey varchar(255) DEFAULT NULL,
  parkname varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE homegames (
  ID INT NOT NULL AUTO_INCREMENT, 
  yearkey int(11) DEFAULT NULL,
  leaguekey char(2) DEFAULT NULL,
  teamkey char(3) DEFAULT NULL,
  parkkey varchar(255) DEFAULT NULL,
  spanfirst varchar(255) DEFAULT NULL,
  spanlast varchar(255) DEFAULT NULL,
  games int(11) DEFAULT NULL,
  openings int(11) DEFAULT NULL,
  attendance int(11) DEFAULT NULL,
  spanfirst_date date DEFAULT NULL,
  spanlast_date date DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE managers (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(10) DEFAULT NULL,
  yearID smallint(6) NOT NULL,
  teamID char(3) NOT NULL,
  lgID char(2) DEFAULT NULL,
  inseason smallint(6) NOT NULL,
  G smallint(6) DEFAULT NULL,
  W smallint(6) DEFAULT NULL,
  L smallint(6) DEFAULT NULL,
  rank smallint(6) DEFAULT NULL,
  plyrMgr varchar(1) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE managershalf (
  ID INT NOT NULL AUTO_INCREMENT, 
  playerID varchar(10) NOT NULL,
  yearID smallint(6) NOT NULL,
  teamID char(3) NOT NULL,
  lgID char(2) DEFAULT NULL,
  inseason smallint(6) DEFAULT NULL,
  half smallint(6) NOT NULL,
  G smallint(6) DEFAULT NULL,
  W smallint(6) DEFAULT NULL,
  L smallint(6) DEFAULT NULL,
  rank smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE pitching (
  ID INT NOT NULL AUTO_INCREMENT,
  playerID varchar(9) NOT NULL,
  yearID smallint(6) NOT NULL,
  stint smallint(6) NOT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  W smallint(6) DEFAULT NULL,
  L smallint(6) DEFAULT NULL,
  G smallint(6) DEFAULT NULL,
  GS smallint(6) DEFAULT NULL,
  CG smallint(6) DEFAULT NULL,
  SHO smallint(6) DEFAULT NULL,
  SV smallint(6) DEFAULT NULL,
  IPouts int(11) DEFAULT NULL,
  H smallint(6) DEFAULT NULL,
  ER smallint(6) DEFAULT NULL,
  HR smallint(6) DEFAULT NULL,
  BB smallint(6) DEFAULT NULL,
  SO smallint(6) DEFAULT NULL,
  BAOpp double DEFAULT NULL,
  ERA double DEFAULT NULL,
  IBB smallint(6) DEFAULT NULL,
  WP smallint(6) DEFAULT NULL,
  HBP smallint(6) DEFAULT NULL,
  BK smallint(6) DEFAULT NULL,
  BFP smallint(6) DEFAULT NULL,
  GF smallint(6) DEFAULT NULL,
  R smallint(6) DEFAULT NULL,
  SH smallint(6) DEFAULT NULL,
  SF smallint(6) DEFAULT NULL,
  GIDP smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE pitchingpost (
  ID INT NOT NULL AUTO_INCREMENT,
  playerID varchar(9) NOT NULL,
  yearID smallint(6) NOT NULL,
  round varchar(10) NOT NULL,
  teamID char(3) DEFAULT NULL,
  lgID char(2) DEFAULT NULL,
  W smallint(6) DEFAULT NULL,
  L smallint(6) DEFAULT NULL,
  G smallint(6) DEFAULT NULL,
  GS smallint(6) DEFAULT NULL,
  CG smallint(6) DEFAULT NULL,
  SHO smallint(6) DEFAULT NULL,
  SV smallint(6) DEFAULT NULL,
  IPouts int(11) DEFAULT NULL,
  H smallint(6) DEFAULT NULL,
  ER smallint(6) DEFAULT NULL,
  HR smallint(6) DEFAULT NULL,
  BB smallint(6) DEFAULT NULL,
  SO smallint(6) DEFAULT NULL,
  BAOpp double DEFAULT NULL,
  ERA double DEFAULT NULL,
  IBB smallint(6) DEFAULT NULL,
  WP smallint(6) DEFAULT NULL,
  HBP smallint(6) DEFAULT NULL,
  BK smallint(6) DEFAULT NULL,
  BFP smallint(6) DEFAULT NULL,
  GF smallint(6) DEFAULT NULL,
  R smallint(6) DEFAULT NULL,
  SH smallint(6) DEFAULT NULL,
  SF smallint(6) DEFAULT NULL,
  GIDP smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE salaries (
  ID INT NOT NULL AUTO_INCREMENT, 
  yearID smallint(6) NOT NULL,
  teamID char(3) NOT NULL,
  lgID char(2) NOT NULL,
  playerID varchar(9) NOT NULL,
  salary double DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE seriespost (
  ID INT NOT NULL AUTO_INCREMENT, 
  yearID smallint(6) NOT NULL,
  round varchar(5) NOT NULL,
  teamIDwinner varchar(3) DEFAULT NULL,
  lgIDwinner varchar(2) DEFAULT NULL,
  teamIDloser varchar(3) DEFAULT NULL,
  lgIDloser varchar(2) DEFAULT NULL,
  wins smallint(6) DEFAULT NULL,
  losses smallint(6) DEFAULT NULL,
  ties smallint(6) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--Changes to Database

#1. CREATE INDEX allstarfull_player ON allstarfull(playerID);
CREATE INDEX allstarfull_year ON allstarfull(yearID);
CREATE INDEX appearances_year ON appearances(yearID);
CREATE INDEX appearances_player ON appearances(playerID);
CREATE INDEX awardsm_player ON awardsmanagers(playerID);
CREATE INDEX awardsm_year ON awardsmanagers(yearID);
CREATE INDEX awardsp_player ON awardsplayers(playerID);
CREATE INDEX awardsp_year ON awardsplayers(yearID);
CREATE INDEX awardssm_player ON awardssharemanagers(playerID);
CREATE INDEX awardssm_year ON awardssharemanagers(yearID);
CREATE INDEX awardssp_year ON awardsshareplayers(yearID);
CREATE INDEX awardssp_player ON awardsshareplayers(playerID);
CREATE INDEX batting_player ON batting(playerID);
CREATE INDEX batting_year ON batting(yearID);
CREATE INDEX battingp_year ON battingpost(yearID);
CREATE INDEX battingp_player ON battingpost(playerID);
CREATE INDEX collegep_player ON collegeplaying(playerID);
CREATE INDEX collegep_year ON collegeplaying(yearID);
CREATE INDEX fielding_player ON fielding(playerID);
CREATE INDEX fielding_year ON fielding(yearID);
CREATE INDEX fieldingof_player ON fieldingof(playerID);
CREATE INDEX fieldingof_year ON fieldingof(yearID);
CREATE INDEX fieldingofs_player ON fieldingofsplit(playerID);
CREATE INDEX fieldingofs_year ON fieldingofsplit(yearID);
CREATE INDEX fieldingp_player ON fieldingpost(playerID);
CREATE INDEX fieldingp_year ON fieldingpost(yearID);
CREATE INDEX halloffame_player ON halloffame(playerID);
CREATE INDEX halloffame_year ON halloffame(yearID);
CREATE INDEX homegames_year ON homegames(yearkey);
CREATE INDEX managers_player ON managers(playerID);
CREATE INDEX managers_year ON managers(yearID);
CREATE INDEX managersh_player ON managershalf(playerID);
CREATE INDEX managersh_year ON managershalf(yearID);
CREATE INDEX pitching_player ON pitching(playerID);
CREATE INDEX pitching_year ON pitching(yearID);
CREATE INDEX pitchingp_player ON pitchingpost(playerID);
CREATE INDEX pitchingp_year ON pitchingpost(yearID);
CREATE INDEX salaries_player ON salaries(playerID);
CREATE INDEX salaries_year ON salaries(yearID);
CREATE INDEX seriesp_year ON seriespost(yearID);
CREATE INDEX teams_year ON teams(yearID);
CREATE INDEX teamsh_year ON teamshalf(yearID);


#2. Alter Table appearances ADD G_rf smallint(6);

#3. G_of consists of the number of appearances in outfield positions (G_rf - right field, G_cf - center field, G_lf - left field)

#4. This error was fixed by using the updated .csv files in our database. finalGameDate description in original database was incorrect and #was reflected as "Date that player made first major league appearance (blank if still active)" instead of "first" being "last"

#5. This error was fixed in our database as data was added from the FieldingofSplit.csv file into our database. 

#6. ID 5375 belongs to “semiema01”, while ID 5375 in original baseball database belongs to “bailean01”; In original baseball database #“bailean01” appears later after the 2010 all star appearance; Through checking the updated allstarfull.csv, the second all star game for #“bailean01” should instead be in 2009 (coming before the ID of 4616, year 2010) belonging to ID 4543. This error was fixed by using the #updated allstarfull.csv file in our database.
