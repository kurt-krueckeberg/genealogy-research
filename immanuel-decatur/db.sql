create table if not exits person (
   id int auto_increment,
   sex ENUM('m', 'f'), 
   fname varchar(45) not null,
   lname varchar(20) not null,
   bdate date,
#-- birth date, dord, kreis and land
   bdorf varchar(15),
   bkreis varchar(20),
   bland varchar(25),
   is_founder boolean,
   primary key(id)
);

#--This tracks Church ceremonies performed on the date, by the pastorid,
#--at the parish.
#--MSince mrriage is a joint ceremony that involves two people, we have 
#--we create another table participants to associated, to linbk, the partipants
R--for whom the ceremony occurs. Otherwise, the other attributes--date,
#--pastor and parish--would be duplicated for each couple in a marriage.
create table if not exists ceremony (
  id int auto_increment,
  date date,
  type ENUM('baptize','confirm','marry'),
  parish varchar(20), 
  pastorid int,  
  foreign key (person) reference person(id),
  foreign key (pastorid) reference person(id),
  primary key(id)
);

#--This table associates particpants in a  ceremony with the ceremony
#--and gives their role in the ceremony. It is a 'link' table whose key
#--are the two attributes that that reference 1. the person in the ceremony
#--and the ceremony in which they participated.
create if not exists participants (
  id int auto_increment,
  cermid int,
  role ENUM('baby', 'communicant', 'engaged', 'godparent'),
  unique key(id, cermid),
  foreign key (dermid) references ceremony(id),
  foregin key (id) references person(id)
};

#--The married couple or 'family` consists of the husband husbid and wife
#--wifeid. Their children, if any, are in the children table, whose familyid
#--references family(id) its husbid and wifeid who are the father and mother,
#--respectively, of the child.
create table if not exists family (
  id int auto_increment,
  husbid int,
  wifeid int,
#-- Emgiration is not a church ceremony, but here a family event (all the amily emigrated or most). But
#-- this database is only for capturing the details about the Immanuel founders and their families. It is not an all-purpose
#-- design for German couplesE and their families who emigrated--although it could be futher generalized.
  emigdate date, 
  unique key (husbid, wifeid),
  foreign key (husbid) references person(id), 
  foreign key (wifeid) references person(id), 
  primary key(id)
);

#--The godprents table's role is performed by the participants table.
#--List of Pathen or Taufpathen at baptism
#--create table if not exist godparent (
#--  id int auto_increment,
#--  baptismid int,
#--  foreign key (baptismid) references ceremony(id),
#--  foreign key (id) references person(id),
#--  primary key(id)
#--);

create table if not exists children (
  id int auto_increment,
  famlyid int,
  foreign key (id) references person(id),
  foreign key (famlyid) references family(id),
  primary key(id)
);
