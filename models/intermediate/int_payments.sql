select
    order_id,
    sum(payment_value) as total_payment,
    min(payment_type) as payment_type
from {{ ref('stg_order_payments') }}
group by order_id