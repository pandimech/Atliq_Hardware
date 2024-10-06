/* 4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference*/
WITH cte AS(
	SELECT 
		p.segment,
		COUNT(DISTINCT CASE WHEN s.fiscal_year='2020' THEN s.product_code ELSE NULL END) AS product_count_2020,
		COUNT(DISTINCT CASE WHEN s.fiscal_year='2021' THEN s.product_code ELSE NULL END) AS product_count_2021
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code=p.product_code
GROUP BY p.segment
)
SELECT *,product_count_2021-product_count_2020 AS difference
 FROM cte
 ORDER BY difference DESC;