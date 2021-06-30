with base as (

    select *
    from {{ var('timesheet_user') }}
    where not coalesce(
        is_deleted,
        false
    )

), renamed as (

    select
        id as timesheet_user_id,
        _fivetran_synced,
        created_date as created_at,
        crew_resource_type_c as crew_resource_type,
        last_modified_date as last_modified_at,
        name as display_name,
        sitetracker_active_c as is_active,
        sitetracker_calendar_c as calendar_id,
        sitetracker_territory_c as territory_id,
        sitetracker_type_c as timesheet_user_type,
        sitetracker_user_c as user_id

    from base

)

select *
from renamed
