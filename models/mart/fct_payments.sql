with base as (
    select
        order_id,
        payment_type,
        total_payment
    from {{ ref('int_payments') }}
),

aggregated as (
    select
        order_id,
        payment_type,
        total_payment,
        1 as payment_count
    from base
)

select * from aggregated
