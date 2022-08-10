# - BirthDate and DeathDate are cached in NameTable for historical reasons. They exist in the EventTable 
CREATE TABLE NameTable (NameID INTEGER PRIMARY KEY, OwnerID INTEGER, Surname TEXT COLLATE ?????, Given TEXT COLLATE ?????, NameType INTEGER, IsPrimary INTEGER, 

# - Use PersonID of 0 to indicate the unknonw person
CREATE TABLE PersonTable (PersonID INTEGER PRIMARY KEY, UniqueID TEXT, Sex INTEGER, ParentID INTEGER, SpouseID INTEGER, Color INTEGER, Relate1 INTEGER, Relate2 INTEGER, Flags INTEGER, Living INTEGER, IsPrivate INTEGER, Proof INTEGER, Bookmark INTEGER, Note TEXT, UTCModDate FLOAT );

#- Make FatherID and MotherID and ChildID foreign keys refereinceing PersonTabler.PersonID.
# - Make the pair FatherID/MotherID unique, an additional key
CREATE TABLE FamilyTable (FamilyID INTEGER PRIMARY KEY, FatherID INTEGER, MotherID INTEGER, ChildID INTEGER, HusbOrder INTEGER, WifeOrder INTEGER, IsPrivate INTEGER, Proof INTEGER, SpouseLabel INTEGER, FatherLabel INTEGER, MotherLabel INTEGER, SpouseLabelStr TEXT, FatherLabelStr TEXT, MotherLabelStr TEXT, Note TEXT, UTCModDate FLOAT );
