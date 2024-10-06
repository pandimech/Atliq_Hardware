/*
          5. Get the products that have the highest and lowest manufacturing costs.
			The final output should contain these fields,
			product_code
			product
			manufacturing_cost 


*/

SELECT 
p.product_code,
p.product,
MAX(m_c.manufacturing_cost) 
FROM fact_manufacturing_cost m_c
JOIN dim_product p
ON m_c.product_code=p.product_code

UNION 

SELECT 
p.product_code,
p.product,
MIN(m_c.manufacturing_cost) 
FROM fact_manufacturing_cost m_c
JOIN dim_product p
ON m_c.product_code=p.product_code;


