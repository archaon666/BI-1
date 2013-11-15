logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE DW_Product(

	ProductID INTEGER NOT NULL,
	ProductNumber INTEGER NOT NULL,
	NAME VARCHAR(30) NOT NULL,
	StandardCost NUMERIC(20,2),
	ListPrice NUMERIC(20,2),
	ProductSubCategoryID INTEGER,
	ProductTopCategoryID INTEGER,
	SellStartDate INTEGER,
	SellEndDate INTEGER,
	DiscontinuedDate INTEGER,
	Size NUMERIC(20,2),
	Weight NUMERIC(20,2), 
	IsBulkyItem INTEGER NOT NULL,
	
	
	CONSTRAINT PK_ProcductID PRIMARY KEY (ProductID),
	CONSTRAINT FK_ProductSubCategoryID FOREIGN KEY (ProductSubCategoryID) REFERENCES WITH NO CHECK OPTION DW_ProductCategory(ProductCategoryID),
	CONSTRAINT FK_ProductTopCategoryID FOREIGN KEY (ProductTopCategoryID) REFERENCES WITH NO CHECK OPTION DW_ProductCategory(ProductCategoryID),
	CONSTRAINT FK_SellStartDate FOREIGN KEY (SellStartDate) REFERENCES WITH NO CHECK OPTION DW_Time(DateID),
	CONSTRAINT FK_SellEndDate FOREIGN KEY (SellEndDate) REFERENCES WITH NO CHECK OPTION DW_Time(DateID),
	CONSTRAINT FK_DiscontinuedDate FOREIGN KEY (DiscontinuedDate) REFERENCES WITH NO CHECK OPTION DW_Time(DateID)	
);