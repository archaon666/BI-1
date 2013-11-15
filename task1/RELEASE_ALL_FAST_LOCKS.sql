logon localtd/dbc,dbc;
database bi_user;

RELEASE LOCK BI_User.TB_CUstomerAddress;
RELEASE LOCK BI_User.TB_SalesOrderDetail;
RELEASE LOCK BI_User.TB_Product;
RELEASE LOCK BI_User.TB_ProductCategory;
RELEASE LOCK BI_User.TB_SalesOrderHeader;
RELEASE LOCK BI_User.TB_Address;
RELEASE LOCK BI_User.TB_ShipMethod;
RELEASE LOCK BI_User.TB_Customer;
COMMIT;