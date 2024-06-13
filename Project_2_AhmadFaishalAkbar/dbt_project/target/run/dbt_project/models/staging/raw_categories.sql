
  
    

  create  table "db_test1"."warehouse"."raw_categories__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "categoryID",
    "categoryName",
    "description",
    "picture"
FROM
    "db_test1"."public"."categories"
  );
  