logon localtd/dbc,dbc;
database bi_user;

INSERT INTO DW_Product (
	ProductID,
	ProductNumber,
	Name,
	ModelName,
	StandardCost,
	ListPrice,
	ProductSubCategory,
	ProductTopCategory,
	SellStartDate,
	SellEndDate,
	DiscontinuedDate,
	Size,
	Weight,
	IsBulkyItem
)
Select
	a.ProductID,
	a.ProductNumber,
	a.Name,
	a.ProductModelName as ModelName,
	a.StandardCost,
	a.ListPrice,
	b.Name as ProductSubCategory,
	c.Name as ProductTopCategory,
	a.SellStartDate,
	a.SellEndDate,
	a.DiscontinuedDate,
	a.Size,
	a.Weight,
	CASE WHEN a.ProductCategoryID = 1 OR b.ParentProductCategoryID = 1 OR a.ProductCategoryID in (16,18,20) THEN 1 ELSE 0 END AS IsBulkyItem
FROM TB_PRODUCT a 
LEFT JOIN
TB_PRODUCTCATEGORY b
ON (a.ProductCategoryID = b.ProductCategoryID)
LEFT JOIN
TB_PRODUCTCATEGORY c
ON (b.ParentProductCategoryID = c.ProductCategoryID);