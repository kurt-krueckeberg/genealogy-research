# - Create two tables from NameTable
CREATE TABLE NameTable (NameID INTEGER PRIMARY KEY, OwnerID INTEGER, Surname TEXT COLLATE ?????, Given TEXT COLLATE ?????, NameType INTEGER, , IsPrimary INTEGER, 
Create Table BirthDeath (PersonID foreign key reference PersonTable.PersonID, BirthYear INTEGER, DeathYear INTEGER);
