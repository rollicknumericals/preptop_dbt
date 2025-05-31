select
    product_category_name,
    product_category_name_english
from {{ source('preptop_raw', 'product_category_name_translation') }}