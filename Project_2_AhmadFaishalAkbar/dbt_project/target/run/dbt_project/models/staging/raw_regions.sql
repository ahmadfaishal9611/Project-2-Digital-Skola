
  
    

  create  table "db_test1"."warehouse"."raw_regions__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "regionID",
    "regionDescription"
FROM
    "db_test1"."public"."regions"
  );
  