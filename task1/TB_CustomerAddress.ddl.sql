logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE TB_CustomerAddress (
	CustomerID	Integer NOT NULL,
	AddressID	Integer NOT NULL,
	AddressType	VARCHAR(100) NOT NULL,
	CONSTRAINT PK_CustomerAddress PRIMARY KEY (CustomerID, AddressID),
	CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES WITH NO CHECK OPTION TB_Customer(CustomerID),
	CONSTRAINT FK_Address FOREIGN KEY (AddressID) REFERENCES WITH NO CHECK OPTION TB_Address(AddressID)
);