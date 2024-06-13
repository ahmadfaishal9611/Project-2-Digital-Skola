
  
    

  create  table "db_test1"."warehouse"."raw_orders__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "orderID",
    "customerID",
    "employeeID",
    "orderDate",
    "requiredDate",
    "shippedDate",
    "shipVia",
    "freight",
    "shipName",
    "shipAddress",
    "shipCity",
    "shipRegion",
    "shipPostalCode",
    "shipCountry"
FROM
    "db_test1"."public"."orders"
  );
  