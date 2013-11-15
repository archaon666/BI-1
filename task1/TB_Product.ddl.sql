logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE TB_Product (
	ProductID		INTEGER NOT NULL,
	Name			VARCHAR(100) NOT NULL,
	ProductNumber		VARCHAR(100) NOT NULL,
	StandardCost		NUMERIC(20,2) NOT NULL,
	ListPrice		NUMERIC(20,2) NOT NULL,
	Size			VARCHAR(100),
	Weight			NUMERIC(20,4),
	ProductCategoryID 	INTEGER NOT NULL,
	ProductModelName	VARCHAR(100),
	SellStartDate		TIMESTAMP(3) NOT NULL,
	SellEndDate		TIMESTAMP(3),
	DiscontinuedDate	TIMESTAMP(3),
	CONSTRAINT PK_Product PRIMARY KEY (ProductID),
	CONSTRAINT FK_ProductCategory FOREIGN KEY (ProductCategoryID) REFERENCES WITH NO CHECK OPTION TB_ProductCategory(ProductCategoryID)
);