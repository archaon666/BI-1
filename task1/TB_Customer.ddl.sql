logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE TB_Customer (
	CustomerID	INTEGER	NOT NULL,
	"Title"		VARCHAR(100),
	FirstName	VARCHAR(100) NOT NULL,
	MiddleName	VARCHAR(100),
	LastName	VARCHAR(100) NOT NULL,
	Suffix		VARCHAR(100),
	EmailAddress	VARCHAR(100),
	Phone		VARCHAR(100),
	Gender		VARCHAR(100) NOT NULL,
	Birthdate	DATE NOT NULL,
	CONSTRAINT PK_Customer PRIMARY KEY (CustomerID)
);