logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_FactSales(
	SalesOrderNumber VARCHAR(100) NOT NULL,
	SalesOrderLineNumber VARCHAR(100) NOT NULL,
	CustomerID INTEGER NOT NULL,
	ProductID INTEGER NOT NULL,
	ShipToAddressID INTEGER NOT NULL,
	BillToAddressID INTEGER NOT NULL, 
	ShipmentMethod VARCHAR(100) NOT NULL,
	UnitPrice NUMERIC(20,2),
	Discount NUMERIC(10,4),
	OrderQuantity INTEGER NOT NULL,
	OrderLineTotal NUMERIC(10,4),
	OrderLineProfit NUMERIC(10,4),
	TaxAmount NUMERIC(10,4),
	OrderLineFreightCost NUMERIC(10,4),
	OrderStatus INTEGER,
	OrderDate TIMESTAMP(3),
	DueDate	TIMESTAMP(3),
	ShipDate TIMESTAMP(3),
	IsLateShipment INTEGER NOT NULL,
	
	CONSTRAINT PK_FactSales PRIMARY KEY (SalesOrderNumber,SalesOrderLineNumber),
	CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES WITH NO CHECK OPTION DW_Product(ProductID),
	CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES WITH NO CHECK OPTION DW_Customer(CustomerID),
	CONSTRAINT FK_ShipToAddressID FOREIGN KEY (ShipToAddressID) REFERENCES WITH NO CHECK OPTION DW_Location(AddressID),
	CONSTRAINT FK_BillToAddressID FOREIGN KEY (BillToAddressID) REFERENCES WITH NO CHECK OPTION DW_Location(AddressID),
	CONSTRAINT FK_OrderDate FOREIGN KEY (OrderDate) REFERENCES WITH NO CHECK OPTION DW_Time("Date"),	
	CONSTRAINT FK_DueDate FOREIGN KEY (DueDate) REFERENCES WITH NO CHECK OPTION DW_Time("Date"),	
	CONSTRAINT FK_ShipDate FOREIGN KEY (ShipDate) REFERENCES WITH NO CHECK OPTION DW_Time("Date")	
);