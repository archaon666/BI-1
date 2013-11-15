logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_Customer(

	CustomerID INTEGER NOT NULL,
	Name VARCHAR(30) NOT NULL,
	Age INTEGER NOT NULL,
	GENDER VARCHAR(10) NOT NULL,
	EMAIL VARCHAR(30) NOT NULL,
	PHONE VARCHAR(30),
	CONSTRAINT PK_CustomerID PRIMARY KEY (CustomerID)
	
);