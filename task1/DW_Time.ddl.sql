logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_Time(
	DateID Integer NOT NULL,
	TDATE TIMESTAMP(0) NOT NULL,
	DayNumberOfMonth INTEGER NOT NULL,
	MonthNumberOf VARCHAR(30) NOT NULL,
	CalendarYear VARCHAR(30) NOT NULL,
	CONSTRAINT PK_Date PRIMARY KEY (DateID)
	
);