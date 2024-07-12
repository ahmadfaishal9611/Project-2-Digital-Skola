WITH a AS(
	SELECT
		DATE_TRUNC('month', "orderDate") AS month,
		"employeeName",
		SUM("grossRevenue") AS "grossRevenue",
		DENSE_RANK() OVER (PARTITION BY DATE_TRUNC('month', "orderDate") ORDER BY SUM("grossRevenue") DESC) AS rank
	FROM {{ ref('fact_order_details') }}
	GROUP BY month, "employeeName"
)
	SELECT
		month,
		"employeeName" AS "bestEmployee",
		"grossRevenue"
	FROM a
	WHERE rank=1
	ORDER BY month
