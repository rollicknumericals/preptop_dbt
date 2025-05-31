-- models/staging/stg_customers.sql

select
    customer_id,
    customer_unique_id,
    lower(customer_city) as customer_city,
    customer_state
from {{ source('preptop_raw', 'customers_dataset') }}
