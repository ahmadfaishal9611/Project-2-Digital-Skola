
  
    

  create  table "db_test1"."warehouse"."raw_suppliers__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "supplierID",
    "companyName",
    "contactName",
    "contactTitle",
    "address",
    "city",
    "region",
    "postalCode",
    "country",
    "phone",
    "fax",
    "homePage"
FROM
    "db_test1"."public"."suppliers"
  );
  