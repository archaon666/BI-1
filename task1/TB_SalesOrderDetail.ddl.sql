logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE TB_SalesOrderDetail (
	SalesOrderID		INTEGER NOT NULL,
	SalesOrderDetailID	INTEGER NOT NULL,
	OrderQty		INTEGER NOT NULL,
	ProductID		INTEGER NOT NULL,
	UnitPrice		NUMERIC(20,2) NOT NULL,
	CONSTRAINT PK_SalesOrderDetail PRIMARY KEY (SalesOrderID, SalesOrderDetailID),
	CONSTRAINT FK_SalesOrder FOREIGN KEY (SalesOrderID) REFERENCES WITH NO CHECK OPTION TB_SalesOrderHeader(SalesOrderID),
	CONSTRAINT FK_Product FOREIGN KEY (ProductID) REFERENCES WITH NO CHECK OPTION TB_Product(ProductID)
);