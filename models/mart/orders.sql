-- models/mart/orders.sql

select
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    p.payment_type,
    p.total_payment
from {{ ref('int_orders') }} o
left join {{ ref('int_customers') }} c
    on o.customer_id = c.customer_id
left join {{ ref('int_payments') }} p
    on o.order_id = p.order_id