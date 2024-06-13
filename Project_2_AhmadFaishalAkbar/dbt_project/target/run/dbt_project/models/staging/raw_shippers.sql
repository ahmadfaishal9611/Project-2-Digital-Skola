
  
    

  create  table "db_test1"."warehouse"."raw_shippers__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "shipperID",
    "companyName",
    "phone"
FROM
    "db_test1"."public"."shippers"
  );
  