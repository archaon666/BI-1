logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_Time(
	"Date" TIMESTAMP(3) NOT NULL,
	DayNumberOfMonth INTEGER,
	MonthNumberOf INTEGER,
	CalendarYear INTEGER,
	CONSTRAINT PK_Date PRIMARY KEY ("Date")
	
);