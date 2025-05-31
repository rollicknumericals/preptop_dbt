select
    order_id,
    order_item_id,
    product_id,
    seller_id,
    cast(shipping_limit_date as timestamp) as shipping_limit_date,
    cast(price as numeric) as price,
    cast(freight_value as numeric) as freight_value
from {{ source('preptop_raw', 'order_items_dataset') }}