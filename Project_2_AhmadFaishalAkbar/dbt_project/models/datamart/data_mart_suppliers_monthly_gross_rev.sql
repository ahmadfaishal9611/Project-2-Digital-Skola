SELECT
	DATE_TRUNC('month', "orderDate") AS month,
	"supplierCompany",
	SUM("grossRevenue")	AS "grossRevenue"
FROM {{ ref('dwh_order_details') }}
GROUP BY month, "supplierCompany"
ORDER BY month
