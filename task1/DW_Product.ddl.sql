logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_Product(

	ProductID INTEGER NOT NULL,
	ProductNumber VARCHAR(50) NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	ModelName VARCHAR(30),
	StandardCost NUMERIC(20,2) NOT NULL,
	ListPrice NUMERIC(20,2) NOT NULL,
	ProductSubCategory VARCHAR(50),
	ProductTopCategory VARCHAR(50),
	SellStartDate TIMESTAMP(3) NOT NULL,
	SellEndDate TIMESTAMP(3),
	DiscontinuedDate TIMESTAMP(3),
	Size VARCHAR(30),
	Weight NUMERIC(20,4), 
	IsBulkyItem INTEGER NOT NULL,
	
	
	CONSTRAINT PK_ProcductID PRIMARY KEY (ProductID),
	CONSTRAINT FK_SellStartDate FOREIGN KEY (SellStartDate) REFERENCES WITH NO CHECK OPTION DW_Time("Date"),
	CONSTRAINT FK_SellEndDate FOREIGN KEY (SellEndDate) REFERENCES WITH NO CHECK OPTION DW_Time("Date"),
	CONSTRAINT FK_DiscontinuedDate FOREIGN KEY (DiscontinuedDate) REFERENCES WITH NO CHECK OPTION DW_Time("Date")	
);