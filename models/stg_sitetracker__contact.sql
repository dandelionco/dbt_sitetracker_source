with base as (

    select *
    from {{ var('contact') }}
    where not coalesce(
        is_deleted,
        false
    )

), renamed as (

    select
        id as contact_id,
        _fivetran_synced,
        created_date as created_at,
        email,
        cast(hub_spot_contact_id_c as int64) as deal_id,
        last_modified_date as last_modified_at,
        name as full_name,
        phone as phone_number
        
    from base

)

select *
from renamed
