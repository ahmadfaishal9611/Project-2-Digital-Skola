
  
    

  create  table "db_test1"."warehouse"."raw_employee_territories__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "employeeID",
    "territoryID"
FROM
    "db_test1"."public"."employee_territories"
  );
  