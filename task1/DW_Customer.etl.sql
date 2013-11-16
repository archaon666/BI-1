logon localtd/dbc,dbc;
database bi_user;

INSERT INTO DW_CUSTOMER (
	CustomerID,
	"Name",
	BirthDate,
	Age,
	Gender,
	Email,
	Phone
)
SELECT
	CustomerID,
	FirstName ||
	CASE WHEN MiddleName IS NOT NULL THEN
		' [' || MiddleName || '.]' 
	ELSE
		''
	END ||
	' ' || LastName ||
	CASE WHEN Suffix IS NOT NULL THEN
		' [, ' || Suffix || ']'
	ELSE
		''
	END
	AS "NAME",
	CAST(Birthdate as TIMESTAMP(3)) as BirthDate, 
	(('2013-01-01' (TIMESTAMP(3), format 'YYYY-MM-DD')) - CAST(BirthDate as TIMESTAMP(3))) YEAR(4) AS AGE,
	CASE WHEN Gender = 'M' THEN 'Male' ELSE 'Female' END Gender,
	EmailAddress as EMail,
	Phone
FROM TB_CUSTOMER;