CREATE TABLE orders(
order_number SERIAL,
membership_number integer,
snack_id integer,
PRIMARY KEY(order_number),
FOREIGN KEY (membership_number) REFERENCES public.customers (membership_number),
FOREIGN KEY (snack_id) REFERENCES public.snacks (snack_id)
)