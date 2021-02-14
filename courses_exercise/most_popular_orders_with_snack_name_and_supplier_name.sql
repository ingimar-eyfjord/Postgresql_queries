SELECT
su.snack_supplier_name as supplier_name,
s.snack_name AS snack_name,
COUNT(o.snack_id) AS value_occurrence
FROM public.orders o
INNER JOIN
(SELECT snack_name,
snack_id,
snack_supplier_code
FROM public.snacks GROUP
BY snack_id) s  ON s.snack_id = o.snack_id
INNER JOIN
(SELECT 
snack_supplier_name,
snack_supplier_code
FROM public.snack_supplier GROUP
BY snack_supplier_code,
snack_supplier_name) SU ON SU.snack_supplier_code = s.snack_supplier_code GROUP
BY 
o.snack_id,
su.snack_supplier_name,
snack_name
ORDER
BY value_occurrence DESC
	