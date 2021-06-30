with base as (

    select *
    from {{ var('calendar_event_assignment') }}
    where not coalesce(
        is_deleted,
        false
    )

), renamed as (

    select
        id as calendar_event_assignment_id,
        _fivetran_synced,
        created_date as created_at,
        last_modified_date as last_modified_at,
        name as display_name,
        sitetracker_calendar_event_c as calendar_event_id,
        sitetracker_mobile_name_c as mobile_display_name,
        sitetracker_resource_c as resource_id,
        sitetracker_status_c as status
        
    from base

)

select *
from renamed
