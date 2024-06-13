
  
    

  create  table "db_test1"."warehouse"."raw_territories__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "territoryID",
    "territoryDescription",
    "regionID"
FROM
    "db_test1"."public"."territories"
  );
  