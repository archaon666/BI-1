logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_Location(

	AddressID INTEGER NOT NULL,
	PostalCode VARCHAR(30) NOT NULL,
	City VARCHAR(30) NOT NULL,
	StateProvince VARCHAR(30),
	CountryRegion VARCHAR(30) NOT NULL,
	CONSTRAINT PK_AddressID PRIMARY KEY (AddressID)
	);