SELECT
customer.country AS coutry,
s.snack_name as snack_name,
COUNT(o.snack_id) AS value_occurence
FROM public.orders o
INNER JOIN
(SELECT
snack_name,
snack_id
FROM public.snacks
GROUP
BY
snack_name,
snack_id) s
ON s.snack_id = o.snack_id
INNER JOIN
(SELECT
 country
 FROM public.customers
 GROUP
 BY
 country)
 customer
 ON
 s.snack_id = o.snack_id
 GROUP
 BY
 snack_name,
 country
 ORDER
 BY
snack_name
 DESC