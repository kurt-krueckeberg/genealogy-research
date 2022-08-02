= Analysis of the Rootsmagic Database

== Tables Related to Persons, Names, and Relationships, etc.

=== PersonTable

`PersonTable.PersonID` key identifies a unique person (in the family tree) with unique `UniqueID`, which apparently is a `GUID` or hash value that is perhaps a field that in the **GEDCOM** standard.

.Table 1. PersonTable
[width="99%",cols="19%,7%,4%,6%,6%,5%,6%,6%,5%,5%,7%,5%,6%,5%,8%",]
|===
|PersonID Int (Prim Key) |UniqueID TEXT |Sex Int |ParentID Int |SpouseID
Int |Color Int |Relate1 Int |Relate2 Int |Flags Int |Living Int
|IsPrivate Int |Proof Int |Bookmark Int |Note TEXT |UTCModDate Float
|===

=== NameTable

`NameTable` \'s `NameID` key identifies each name that appears in the tree with surname `Surname`, given name `Given`, birth year `BirthYear` and death year `DeathYear`. The "primary" name is given first in order and any alternate names (which typically are alternate given names) immediately follow. `OwnerID` is a foreign key corresponding to the `PersonTable.PersonID` who "owns" this name, the person to whom the name belongs. We infer this from two facts:

. `count(OwnerID) == count(PersonID)`, and
. how else can the `PersonID` be linked to their name (and the other associated facts in the `NameTable` mentioned above)?

.Table 2. NameTable
[width="99%",cols="17%,3%,4%,3%,3%,3%,4%,4%,3%,5%,4%,4%,3%,4%,3%,4%,4%,3%,4%,5%,4%,4%,5%",]
|===
|NameID Int (Prim Key) |OwnerID Int |Surname TEXT |Given TEXT |Prefix
TEXT |Suffix TEXT |Nickname TEXT |NameType Int |Date TEXT |SortDate
BigInt |IsPrimary Int |IsPrivate Int |Proof Int |Sentence TEXT |Note
TEXT |BirthYear Int |DeathYear Int |Display Int |Language TEXT
|UTCModDate Float |SurnameMP TEXT |GivenMP TEXT |NicknameMP TEXT
|===

=== FamilyTable

`FamilyTable` has `FamilyID` key to identify each unique family. The pair `FatherID` and `MotherID` must also clearly be unique. They are no doubt foreign keys that map to
`PersonTable.PersonID`. 

The unique pair `FatherID` plus `MotherID` can have zero or more children. I doubt that a child is required to constitute a family, but I’m not 100% sure of the predicate for `FamilyTable`.
At any rate, there is no requirement that their offspring ever live and grow up with them.

It appears that if a mother or father is unknown, their `FatherID` or `MotherID` is 0.

*Todo:* Figure out if a Family means they have children. Use my Frankenstein tree. Give a wife to the son, but no children.

.Table 3. FamilyTable
[width="99%",cols="18%,5%,5%,4%,5%,5%,5%,4%,6%,6%,6%,7%,7%,7%,4%,6%",]
|===
|FamilyID Int (Prim Key) |FatherID Int |MotherID Int |ChildID Int
|HusbOrder Int |WifeOrder Int |IsPrivate Int |Proof Int |SpouseLabel Int
|FatherLabel Int |MotherLabel Int |SpouseLabelStr TEXT |FatherLabelStr
TEXT |MotherLabelStr TEXT |Note TEXT |UTCModDate Float
|===

=== ChildTable 

`ChildTable` has key `RecID`. The `ChildID` is no doubt a foreign key referencing the `PersonTable.PersonID`, and `FamilyID` must be a foreign key referencing `FamilyTable.FamilyID`. All
children with the same `FamilyID` belong to the same family in the sense that they have the same set of parents.

Can a child belong to more than one family? 
And what if a person does not yet have an assigned parents. In this case, there would be no entry for them in the `ChildTable` or `FamilyTable`.

.Table 4. ChildTable
[width="97%",cols="16%,14%,14%,14%,14%,14%,14%",]
|===
|RecID Int (Prim Key) |ChildID Int |FamilyID Int |Re lFather Int |Re
lMother Int |Chi ldOrder Int |Is Private Int
|===


== Analysis of Tables Related to Downloaded Ancestry Media Files

== Todoes

=== DB Questions to Figure Out

Figure out if "family" means there must be a child. To test this use my Frankenstein tree. Give a wife to the son, but give them no children, expert and import to rootsmagic.
And create a SQL join statment, left or right join, to determine if there persons with no parents.

SQL to show persons with no children is also desired.

=== Ancestry Medis Files

Incorporate my notes for assigning Ancestry Media Gallery files to the correct person.

=== New DB with Forign Key Contrainst

After figure out the question above, dump the Rootsmagic db and import it into a new DB that has the foreign key contraints described above.

=== Other 

- Look into Webtrees and its tables.

- Look into Tim Forsythe's GEDCOM 5 validator writtenin C++.
