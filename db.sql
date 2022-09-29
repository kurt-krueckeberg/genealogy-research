create table if not exits person (
   id int auto_increment,
   fname varchar(45) not null,
   lname varchar(20) not null,
   birthdate date,
   birthdorf varchar(15),
   birthkreis varchar(20),
   birthland varchar(25),
   is_founder boolean,
   primary key(id)
);

create table if not exists ceremony (
  id int auto_increment,
  date date,
  type ENUM('baptize','confirm','marry'),
  parish varchar(20), 
  pastorid int,  
  foreign key (pastorid) reference person(id),
  primary key(id)
);

create table if not exists family (
  id int auto_increment,
  husbid int,
  wifeid int,
  weddingid int, # I
  unique key (husbid, wifeid),
  foreign key (husbid) references person(id), 
  foreign key (wifeid)  references  person(id), 
  foreign key (weddingid) reference ceremony(id),
  primary key(id)
);

create table if not exits children (
  id int auto_increment,
  famlyid int,
  foreign key (id) references person(id),
  foreign key (famlyid) references family(id),
  primary key(id)
);

# Emigration is not yet included!!!!
