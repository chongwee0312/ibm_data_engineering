-- Create a materialized view to show product data
CREATE MATERIALIZED VIEW "product_info_m-view" AS (
	SELECT
		product.product_name,
		product.description,
		product_type.product_category
	FROM
		product
	JOIN
		product_type
	ON
		product.product_type_id = product_type.product_type_id
);

REFRESH MATERIALIZED VIEW "product_info_m-view";

SELECT * FROM "product_info_m-view";
