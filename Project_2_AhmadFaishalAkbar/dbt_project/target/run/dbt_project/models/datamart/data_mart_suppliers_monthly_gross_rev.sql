
  
    

  create  table "db_test1"."warehouse"."data_mart_suppliers_monthly_gross_rev__dbt_tmp"
  
  
    as
  
  (
    SELECT
	DATE_TRUNC('month', "orderDate") AS month,
	"supplierCompany",
	SUM("grossRevenue")	AS "grossRevenue"
FROM "db_test1"."warehouse"."dwh_order_details"
GROUP BY month, "supplierCompany"
ORDER BY month
  );
  