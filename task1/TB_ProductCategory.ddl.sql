logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE TB_ProductCategory (
	ProductCategoryID	INTEGER NOT NULL,
	ParentProductCategoryID	INTEGER,
	Name			VARCHAR(100) NOT NULL,
	CONSTRAINT PK_ProductCategory PRIMARY KEY (ProductCategoryID),
	CONSTRAINT FK_ParentProductCategory FOREIGN KEY (ParentProductCategoryID) REFERENCES WITH NO CHECK OPTION TB_ProductCategory(ProductCategoryID)
);