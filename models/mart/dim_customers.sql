-- models/mart/dim_customers.sql

with customers as (
    select * from {{ ref('int_customers') }}
),

orders as (
    select order_id, customer_id, order_purchase_timestamp
    from {{ ref('int_orders') }}
),

first_order as (
    select 
        customer_id,
        min(order_purchase_timestamp) as first_order_date
    from orders
    group by customer_id
)

select
    c.customer_id,
    c.customer_unique_id,
    f.first_order_date
from customers c
left join first_order f using (customer_id)
