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

#--Church ceremonies performed on the date, by the pastorid at the parish.
#--Marriage is a joint ceremony that involves two people. We can only view it as a ceremony that applies to
#--two separate inviduals by using a composite key: (id, person)
create table if not exists ceremony (
  id int,
  person int,
  date date,
  type ENUM('baptize','confirm','marry'),
  parish varchar(20), 
  pastorid int,  
  foreign key (person) reference person(id),
  foreign key (pastorid) reference person(id),
  primary key(id, person)
);

#--The married couple or 'family` consists of the husband husbid and wife wifeid. Their children, if any, are in the children table.
#--whose familyid references family(id) its husbid and wifeid who are the father and mother, respectively, of the child.
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

#--List of Pathen or Taufpathen at baptism
create table if not exist godparent (
  id int auto_increment,
  baptismid int,
  foreign key (baptismid) references ceremony(id),
  foreign key (id) references person(id),
  primary key(id)
);

create table if not exists children (
  id int auto_increment,
  famlyid int,
  foreign key (id) references person(id),
  foreign key (famlyid) references family(id),
  primary key(id)
);
