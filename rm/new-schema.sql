-- If we add a PersonID of 0 to mean the "not-yet known" or unknonw person, then other tables that link to PersonTable.PersonID can be made foreign keys, thus making the "link" an actual relational constraint.
-- We won't have to alter any other tables, either. They can keep there references to 0.
-- Is the meaning of some attributes that use 0 overloaded?
-- And we can then import the RM PersonTable as is, and afterward add PeronsID of 0.
CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note TEXT, UTCModDate FLOAT );

-- BirthDate and DeathDate are cached in NameTable for historical reasons. They exist in the EventTable I believe, and I need to figure out how to query for them. 
-- Make OwnerID a foreign key. What about and ParentID, ChildId??
CREATE TABLE NameTable (NameID INTEGER PRIMARY KEY, OwnerID INTEGER, Surname TEXT COLLATE ?????, Given TEXT COLLATE ?????, NameType INTEGER, IsPrimary INTEGER, 
CREATE TABLE NameTable (NameID INTEGER PRIMARY KEY, OwnerID INTEGER, Surname TEXT COLLATE ?????, Given TEXT COLLATE ?????, NameType INTEGER, IsPrimary INTEGER, 

-- Make FatherID and MotherID and ChildID foreign keys refereinceing PersonTabler.PersonID. 
-- Make the pair FatherID/MotherID unique, an additional key. I likely can make ChildID a foreign key? Many of the other attributes like SpouseLable, FatherLabel can be ignored. They are only relevant to RM.
CREATE TABLE FamilyTable (FamilyID INTEGER PRIMARY KEY, FatherID INTEGER, MotherID INTEGER, ChildID INTEGER, HusbOrder INTEGER, WifeOrder INTEGER, IsPrivate INTEGER, Proof INTEGER, SpouseLabel INTEGER, FatherLabel INTEGER, MotherLabel INTEGER, SpouseLabelStr TEXT, FatherLabelStr TEXT, MotherLabelStr TEXT, Note TEXT, UTCModDate FLOAT );
