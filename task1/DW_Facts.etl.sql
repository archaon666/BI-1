logon localtd/dbc,dbc;
database bi_user;

INSERT INTO DW_FactSales(
	SalesOrderNumber,
	SalesOrderLineNumber,
	CustomerID,
	ProductID,
	ShipToAddressID,
	BillToAddressID, 
	ShipmentMethod,
	UnitPrice,
	Discount,
	OrderQuantity,
	OrderLineTotal,
	OrderLineProfit,
	TaxAmount,
	OrderLineFreightCost,
	OrderStatus,
	OrderDate,
	DueDate,
	ShipDate,
	IsLateShipment	
)
SELECT
	a.SalesOrderNumber,
	a.SalesOrderLineNumber,
	a.CustomerID,
	a.ProductID,
	a.ShipToAddressID,
	a.BillToAddressID,
	a.ShipmentMethod,
	a.UnitPrice,
	a.OrderQuantity * a.UnitPrice * a.DiscountRate as Discount,
	a.OrderQuantity,
	a.OrderQuantity * UnitPrice - (a.OrderQuantity * a.UnitPrice * a.DiscountRate )  as OrderLineTotal,
	(a.OrderQuantity * UnitPrice - (a.OrderQuantity * a.UnitPrice * a.DiscountRate ) ) - a.OrderQuantity * a.StandardCost as OrderLineProfit,
	(a.OrderQuantity * UnitPrice - (a.OrderQuantity * a.UnitPrice * a.DiscountRate ) ) *  a.VAT as TaxAmount,
	a.OrderLineFreightCost,
	a.OrderStatus,
	a.OrderDate,
	a.DueDate,
	a.ShipDate,
	a.IsLateShipment
FROM  (
	SELECT
		soh.SalesOrderNumber,
		'SOL' || CAST(soh.SalesOrderID as VARCHAR(20)) || '-' || CAST(sod.SalesOrderDetailID as VARCHAR(20)) as SalesOrderLineNumber,  
		soh.CustomerID,
		sod.ProductID,
		soh.ShipToAddressID,
		soh.BillToAddressID,
		sh."NAME" as ShipmentMethod,
	                sod.UnitPrice,
		CASE WHEN prod.ProductTopCategory = 'Clothing' THEN
			CASE WHEN sod.OrderQty <= 5 and sod.OrderQty < 10 THEN
				0.05
			     WHEN sod.OrderQty >= 10 THEN
				0.1
			     ELSE
				0.0	
			END
		     WHEN prod.ProductTopCategory = 'Accessories' THEN
			CASE WHEN sod.OrderQty <= 5 and sod.OrderQty < 10 THEN
				0.04
			     WHEN sod.OrderQty >= 10 THEN
				0.11
			     ELSE 
				0
			END
		ELSE
			0
		END
		AS DiscountRate,
		sod.OrderQty as OrderQuantity,
		(sod.OrderQty * sh.CostPerUnit) + (BulkyItemSurcharge * prod.IsBulkyItem) as OrderLineFreightCost,
		soh.Status as OrderStatus,
		soh.OrderDate,
		soh.DueDate,
		soh.ShipDate,
		CASE WHEN soh.ShipDate IS NOT NULL AND soh.ShipDate > soh.DueDate THEN
			1
		ELSE
			0
		END IsLateShipment,
		prod.StandardCost,
		CASE WHEN adr.CountryRegion = 'United States' THEN
			0.08
		           WHEN adr.CountryRegion = 'Canada' THEN
			0.13
		           WHEN adr.CountryRegion = 'United Kingdom' THEN
			0.175
		           WHEN adr.CountryRegion = 'Australia' THEN
			0.1
		  END as VAT
	FROM TB_SalesOrderHeader soh,
	           TB_SalesOrderDetail sod,
	           TB_ShipMethod       sh,
	           DW_Product            prod,
	           DW_Location           adr
	WHERE soh.SalesOrderID = sod.SalesOrderID
	AND   sh.ShipMethodID  = soh.ShipMethodID
	AND   sod.ProductID     = prod.ProductID
	AND   adr.AddressID = soh.BillToAddressID
) as a;