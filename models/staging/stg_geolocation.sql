select
    geolocation_zip_code_prefix,
    cast(geolocation_lat as float) as geolocation_lat,
    cast(geolocation_lng as float) as geolocation_lng,
    geolocation_city,
    geolocation_state
from {{ source('preptop_raw', 'geolocation_dataset') }}