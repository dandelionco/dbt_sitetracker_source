with base as (

    select *
    from {{ var('site') }}
    where not coalesce(
        is_deleted,
        false
    )

), renamed as (

    select
        id as site_id,
        _fivetran_synced,
        contact_c as contact_id,
        created_date as created_at,
        hub_spot_deal_id_c as deal_id,
        last_modified_date as last_modified_at,
        name as display_name,
        sitetracker_territory_c as territory_id
        
    from base

)

select *
from renamed
