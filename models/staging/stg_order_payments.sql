With source as (
    select
        *
    from {{ source('preptop_raw', 'order_payments_dataset') }}
)

select 
order_id,
payment_sequential::INTEGER as payment_sequential,
payment_type,
payment_installments::INTEGER as payment_installments,
payment_value::NUMERIC as payment_value

from source
where payment_type != 'not_defined' and payment_type is not null