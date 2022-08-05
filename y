`NameID` is the *primary key*
OwnerID	NameID of owner of name, thus 1 OwnerID can have multiple NameID's for Alternate Names.
Surname	Surname.
Given	Given name.
Prefix
Suffix	
Nickname
`IsPrimary` is a boolean with `1` if this is the first name assigned to person or `0` if an Alternate Name.
BirthYear is either 0 or four-digit year extracted from EventTable.Date for Birth FactType for Person, if Primary Name or Alternate Name.
DeathYear is either 0 or four-digit year extracted from EventTable.Date for Death FactType for Person, if Primary Name or Alternate Name.

