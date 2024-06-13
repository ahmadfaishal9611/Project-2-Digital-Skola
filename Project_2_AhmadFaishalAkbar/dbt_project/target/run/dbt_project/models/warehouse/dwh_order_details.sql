
  
    

  create  table "db_test1"."warehouse"."dwh_order_details__dbt_tmp"
  
  
    as
  
  (
    WITH raw_order_details AS(
    SELECT * FROM "db_test1"."warehouse"."raw_order_details"
),
raw_orders AS(
    SELECT * FROM "db_test1"."warehouse"."raw_orders"
),
raw_employees AS(
    SELECT * FROM "db_test1"."warehouse"."raw_employees"
),
raw_products AS(
    SELECT * FROM "db_test1"."warehouse"."raw_products"
),
raw_categories AS(
    SELECT * FROM "db_test1"."warehouse"."raw_categories"    
),
raw_suppliers AS(
    SELECT * FROM "db_test1"."warehouse"."raw_suppliers"
)
    SELECT
        od."orderID",
        o."orderDate",
        CONCAT(e."firstName",' ', e."lastName") AS "employeeName",
        pd."productName",
        ca."categoryName",
        s."companyName" AS "supplierCompany",
        od."unitPrice",
        od."quantity",
        od."discount",
        ((od."unitPrice" - (od."unitPrice" * od."discount")) * od."quantity") AS "grossRevenue"
    FROM raw_order_details od
    LEFT JOIN raw_orders o ON od."orderID" = o."orderID"
    LEFT JOIN raw_employees e ON o."employeeID" = e."employeeID"
    LEFT JOIN raw_products pd ON od."productID" = pd."productID"
    LEFT JOIN raw_categories ca ON pd."categoryID" = ca."categoryID"
    LEFT JOIN raw_suppliers s ON pd."supplierID" = s."supplierID"
  );
  