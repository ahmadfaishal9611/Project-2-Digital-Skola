
  
    

  create  table "db_test1"."warehouse"."raw_employees__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "employeeID",
    "lastName",
    "firstName",
    "title",
    "titleOfCourtesy",
    "birthDate",
    "hireDate",
    "address",
    "city",
    "region",
    "postalCode",
    "country",
    "homePhone",
    "extension",
    "photo",
    "notes",
    "reportsTo",
    "photoPath"
FROM
    "db_test1"."public"."employees"
  );
  