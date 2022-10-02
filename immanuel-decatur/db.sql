#--The specific problem with German umlauts is often described as 'dictionary order' or 'phone-book order'. 
#--The Unicode default is okay for the former but if you want 'Ü' = 'UE', then you could consider 
#--utf8mb4_de_pb_0900_ai_ci or utf8mb4_german2_ci, assuming character set is utf8mb4.
drop database imman;

CREATE DATABASE IF NOT EXISTS imman CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_german2_ci';

#--Create user and grant privileges to the database:
GRANT ALL PRIVILEGES ON imman.* TO 'kurt'@'localhost' identified by 'kk0457';

use imman;

create table IF NOT EXISTS person (
 id int(11) NOT NULL AUTO_INCREMENT,
 sex ENUM('m', 'f') not null, 
 fname varchar(45) not null,
 lname varchar(20) not null,
 bdate date not null,
 is_founder boolean not null,
 bdorf varchar(15) not null,
 bkreis varchar(20) not null,
 bland varchar(25) not null,
 primary key(id)
);

#--This tracks Church ceremonies performed on the date, by the pastorid,
#--at the parish.
#--MSince mrriage is a joint ceremony that involves two people, we have 
#--we create another table participants to associated, to linbk, the partipants
#--for whom the ceremony occurs. Otherwise, the other attributes--date,
#--pastor and parish--would be duplicated for each couple in a marriage.
create table IF NOT EXISTS ceremony (
  id int(11) NOT NULL AUTO_INCREMENT,
  cermdate date not null,
  cermtype ENUM('baptize','confirm','marry') not null,
  parish varchar(20) not null,
  pastorid int(11) not null,
  foreign key (pastorid) references person(id),
  primary key(id)
);

#--This table associates particpants in a  ceremony with the ceremony
#--and gives their role in the ceremony. It is a 'link' table whose key
#--are the two attributes that that reference 1. the person in the ceremony
#--and the ceremony in which they participated.
create table IF NOT EXISTS participants (
  id int(11) NOT NULL,
  cermid int(11) not null,
  role ENUM('baby', 'communicant', 'engaged', 'godparent') not null,
  foreign key (id) references person(id),
  foreign key (cermid) references ceremony(id),
  primary key(id, cermid)
);

#--The married couple or 'family` consists of the husband husbid and wife
#--wifeid. Their children, if any, are in the children table, whose familyid
#--references family(id) its husbid and wifeid who are the father and mother,
#--respectively, of the child.
#--Note:
#-- Emgiration is not a church ceremony, but here a family event (all the amily emigrated or most). But
#-- this database is only for capturing the details about the Immanuel founders and their families. It is not an all-purpose
#-- design for German couplesE and their families who emigrated--although it could be futher generalized.
create table IF NOT EXISTS family (
  id int(11) NOT NULL AUTO_INCREMENT,
  husbid int(11) not null,
  wifeid int(11) not null,
  emigdate date not null,
  unique key (husbid, wifeid),
  foreign key (husbid) references person(id), 
  foreign key (wifeid) references person(id), 
  primary key(id)
);

#--The godprents table's role is performed by the participants table.
#--List of Pathen or Taufpathen at baptism
#--create table if not exist godparent (
#--  id int(11) NOT NULL AUTO_INCREMENT,
#--  baptismid int,
#--  foreign key (baptismid) references ceremony(id),
#--  foreign key (id) references person(id),
#--  primary key(id)
#--);

create table IF NOT EXISTS children (
  id int(11) NOT NULL AUTO_INCREMENT,
  famlyid int(11) not null,
  foreign key (id) references person(id),
  foreign key (famlyid) references family(id),
  primary key(id)
);
