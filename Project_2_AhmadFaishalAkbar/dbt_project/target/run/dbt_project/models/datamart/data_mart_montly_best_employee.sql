
  
    

  create  table "db_test1"."warehouse"."data_mart_montly_best_employee__dbt_tmp"
  
  
    as
  
  (
    WITH a AS(
	SELECT
		DATE_TRUNC('month', "orderDate") AS month,
		"employeeName",
		SUM("grossRevenue") AS "grossRevenue",
		DENSE_RANK() OVER (PARTITION BY DATE_TRUNC('month', "orderDate") ORDER BY SUM("grossRevenue") DESC) AS rank
	FROM "db_test1"."warehouse"."dwh_order_details"
	GROUP BY month, "employeeName"
)
	SELECT
		month,
		"employeeName" AS "bestEmployee",
		"grossRevenue"
	FROM a
	WHERE rank=1
	ORDER BY month
  );
  