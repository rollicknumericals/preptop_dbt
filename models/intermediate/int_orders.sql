-- models/intermediate/int_orders.sql

with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

order_payments as (
    select * from {{ ref('stg_order_payments') }}
),

-- sum item values and freight by order
order_items_agg as (
    select
        order_id,
        sum(price) as total_price,
        sum(freight_value) as total_freight,
        count(*) as number_of_items
    from order_items
    group by order_id
),

-- sum payments by order
order_payments_agg as (
    select
        order_id,
        sum(payment_value) as total_payment
    from order_payments
    group by order_id
)

select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    
    i.total_price,
    i.total_freight,
    i.number_of_items,
    
    p.total_payment

from orders o
left join order_items_agg i using (order_id)
left join order_payments_agg p using (order_id)
