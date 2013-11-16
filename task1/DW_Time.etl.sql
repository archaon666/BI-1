logon localtd/dbc,dbc;
database bi_user;


INSERT INTO DW_Time (
	"Date",
	DayNumberOfMonth,
	MonthNumberOf,
	CalendarYear
)
select b.dat as "Date",
          EXTRACT(day from b.dat ) as DayNumberOfMonth,
          EXTRACT(month from b.dat ) as MonthNumberOf,
          EXTRACT(year from b.dat ) as CalendarYear
FROM (
	SELECT DISTINCT dates.a as dat from (
		SELECT Birthdate as a
		FROM DW_Customer
		WHERE Birthdate is not NULL
		UNION ALL
		SELECT SellStartDate as a
		FROM DW_Product
		WHERE SellStartDate is not NULL
		UNION ALL
		SELECT SellEndDate as a
		FROM DW_Product
		WHERE SellEndDate is not NULL
		UNION ALL
		SELECT DiscontinuedDate as a
		FROM DW_Product
		WHERE DiscontinuedDate is not NULL
		UNION ALL
		SELECT OrderDate as a
		FROM DW_FactSales
		WHERE OrderDate is not NULL
		UNION ALL
		SELECT DueDate as a
		FROM DW_FactSales
		WHERE DueDate is not NULL
		UNION ALL
		SELECT ShipDate as a
		FROM DW_FactSales
		WHERE ShipDate is not NULL
	) dates
) b;

QUIT;