SELECT snack_id,
    COUNT(snack_id) AS orderer_amount
    FROM     public.orders
    GROUP BY snack_id
    ORDER BY orderer_amount DESC
    LIMIT    15;