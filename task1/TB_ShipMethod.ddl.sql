logon localtd/dbc,dbc;
database bi_user;

CREATE TABLE TB_ShipMethod (
	ShipMethodID		INTEGER NOT NULL,
	Name			VARCHAR(100) NOT NULL,
	CostPerShipment 	NUMERIC(20,2) NOT NULL,
	CostPerUnit		NUMERIC(20,2) NOT NULL,
	BulkyItemSurcharge	NUMERIC(20,2) NOT NULL,
	CONSTRAINT PK_ShipMethod PRIMARY KEY (ShipMethodID)
);