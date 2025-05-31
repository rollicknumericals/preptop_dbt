select
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
from {{ source('preptop_raw', 'sellers_dataset') }}