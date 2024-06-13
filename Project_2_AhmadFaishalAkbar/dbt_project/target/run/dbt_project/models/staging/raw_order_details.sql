
  
    

  create  table "db_test1"."warehouse"."raw_order_details__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "orderID",
    "productID",
    "unitPrice",
    "quantity",
    "discount"
FROM
    "db_test1"."public"."order_details"
  );
  