WITH a AS(
	SELECT
		DATE_TRUNC('month', "orderDate") AS month,
		"categoryName",
		SUM(quantity) AS "totalSold(quantity)",
		DENSE_RANK() OVER (PARTITION BY DATE_TRUNC('month', "orderDate") ORDER BY SUM(quantity) DESC) AS rank
	FROM "db_test1"."warehouse"."dwh_order_details"
	GROUP BY month, "categoryName"
)
	SELECT
		month,
		"categoryName" AS "topProductCategory",
		"totalSold(quantity)"
	FROM a
	WHERE rank=1
	ORDER BY month