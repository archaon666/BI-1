logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE TB_Address(
	AddressID	INTEGER NOT NULL,
	AddressLine	VARCHAR(100) NOT NULL,
	City		VARCHAR(100) NOT NULL,
	StateProvince	VARCHAR(100),
	CountryRegion	VARCHAR(100) NOT NULL,
	PostalCode	VARCHAR(100) NOT NULL,
	CONSTRAINT PK_Address PRIMARY KEY (AddressID)
);