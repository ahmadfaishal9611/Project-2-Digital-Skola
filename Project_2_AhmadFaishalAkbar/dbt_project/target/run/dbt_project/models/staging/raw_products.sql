
  
    

  create  table "db_test1"."warehouse"."raw_products__dbt_tmp"
  
  
    as
  
  (
    SELECT
    "productID",
    "productName",
    "supplierID",
    "categoryID",
    "quantityPerUnit",
    "unitPrice",
    "unitsInStock",
    "unitsOnOrder",
    "reorderLevel",
    "discontinued"
FROM
    "db_test1"."public"."products"
  );
  