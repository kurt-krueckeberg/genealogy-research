CREATE DATABASE IF NOT EXISTS imman CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_german2_ci';

#--Create user and grant privileges to the database:
GRANT ALL PRIVILEGES ON imman.* TO 'kurt'@'localhost' identified by 'kk0457';

use imman;

create table IF NOT EXISTS person (
 id int(11) NOT NULL AUTO_INCREMENT,
 fname varchar(45) not null,
 lname varchar(20) not null,
 sex ENUM('m', 'f', 'u') not null, 
 fid int(11),
 mid int(11),
 bdate date not null,
 founder boolean not null,
 bdorf varchar(15) not null,
 bkreis varchar(20) not null,
 bland varchar(25) not null,
 foreign key (fid) references person(id) on delete set null, 
 foreign key (mid) references person(id) on delete set null,
 primary key(id)
);

#--Insert UNKONWN person into the person table. The unknown person has person(id) of 1, the first auto_increment value, and the fid and mid are also 1, referring this same all-purpose unknown person.
INSERT INTO person (id, fname, lname, sex, fid, mid, bdate, founder, bdorf, bkreis, bland) VALUES (1, "unknown", "unknown", "u", 1, 1, "1000-01-01", false, "unknown", "unknown", "unknown");

#
