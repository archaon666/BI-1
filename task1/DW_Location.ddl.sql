logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_Location(

	AddressID INTEGER NOT NULL,
	PostalCode INTEGER NOT NULL,
	City VARCHAR(30) NOT NULL,
	StateProvince VARCHAR(30) NOT NULL,
	CountryRegion VARCHAR(30) NOT NULL,
	
	CONSTRAINT PK_AddressID PRIMARY KEY (AddressID)
	);