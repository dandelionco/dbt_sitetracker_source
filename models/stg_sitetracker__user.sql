with base as (

    select *
    from {{ var('user') }}

), renamed as (

    select
        id as user_id,
        _fivetran_synced,
        created_date as created_at,
        email,
        first_name,
        is_active,
        last_modified_date as last_modified_at,
        last_name,
        mobile_phone,
        name as full_name
        
    from base

)

select *
from renamed