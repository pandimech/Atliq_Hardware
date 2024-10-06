/* Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage */

SELECT 
p_d.customer_code,
c.customer,
ROUND(AVG(p_d.pre_invoice_discount_pct)*100,2) AS av_dis_per
FROM fact_pre_invoice_deductions p_d
JOIN dim_customer c
ON p_d.customer_code=c.customer_code
WHERE p_d.fiscal_year =2021 AND c.market='India'
GROUP BY c.customer,c.customer_code
ORDER BY av_dis_per DESC
LIMIT 5;