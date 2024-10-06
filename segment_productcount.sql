/*
		Provide a report with all the unique product counts for each segment and
		sort them in descending order of product counts. The final output contains
		2 fields,
					segment
					product_count

*/

SELECT 
p.segment,
COUNT(p.product_code) As product_count
FROM 
fact_sales_monthly s
JOIN dim_product p
ON s.product_code=p.product_code
GROUP BY p.segment

