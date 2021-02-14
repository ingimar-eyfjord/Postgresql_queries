WITH
    ProductQuantityByCountry AS 
(
    SELECT
    p.country,  
	s.snack_name,
	su.snack_supplier_name as supname,
    SUM(od.amount) AS Quantity
    FROM
    order_items AS od
	
	INNER JOIN
	orders AS ord
	ON ord.order_number = od.order_number
	
    INNER JOIN
    customers AS p
    ON p.membership_number = ord.membership_number
	
    INNER JOIN
    snacks AS s
    ON s.snack_id = od.snack_id
	
	INNER JOIN
	snack_supplier as su
	ON s.snack_supplier_code = su.snack_supplier_code
	
    GROUP BY
    p.country,   
	s.snack_name,
	su.snack_supplier_name 
),
    RankedProductQuantityByCountry
AS
(
    SELECT
        RANK() OVER (PARTITION BY country ORDER BY Quantity DESC) AS countryRank,
        *
    FROM
        ProductQuantityByCountry
)
SELECT
    *
FROM
    RankedProductQuantityByCountry
WHERE
    countryRank = 1
ORDER BY
	Quantity DESC