logon localtd/dbc,dbc;
database bi_user;

INSERT INTO DW_LOCATION
(
	AddressID,
	PostalCode,
	City,
	StateProvince,
	CountryRegion
) 
Select
	AddressID,
	PostalCode,
	City,
	StateProvince,
	CountryRegion
FROM TB_Address
;
QUIT;