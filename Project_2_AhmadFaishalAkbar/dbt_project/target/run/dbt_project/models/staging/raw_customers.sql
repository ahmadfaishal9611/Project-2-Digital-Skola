
  
    

  create  table "db_test1"."warehouse"."raw_customers__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "customerID",
    "companyName",
    "contactName",
    "contactTitle",
    "address",
    "city",
    "region",
    "postalCode",
    "country",
    "phone",
    "fax"
FROM
    "db_test1"."public"."customers"
  );
  