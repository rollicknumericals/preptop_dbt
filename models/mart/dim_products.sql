with products as (

    select
        product_id,
        product_category_name,
        product_name_length,
        product_description_length,
        product_photos_qty,
        cast(product_weight_g as integer) as product_weight_g,
        cast(product_length_cm as integer) as product_length_cm,
        cast(product_height_cm as integer) as product_height_cm,
        cast(product_width_cm as integer) as product_width_cm
    from {{ ref('stg_products') }}

),

category_translation as (

    select
        product_category_name as original_category,
        product_category_name_english
    from {{ ref('stg_product_category_name_translation') }}

),

final as (

    select
        p.product_id,
        p.product_category_name,
        ct.product_category_name_english,
        p.product_name_length,
        p.product_description_length,
        p.product_photos_qty,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm
    from products p
    left join category_translation ct
        on p.product_category_name = ct.original_category

)

select * from final
