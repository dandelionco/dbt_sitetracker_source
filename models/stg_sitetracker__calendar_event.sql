with base as (

    select *
    from {{ var('calendar_event') }}
    where not coalesce(
        is_deleted,
        false
    )

), renamed as (

    select
        id as calendar_event_id,
        _fivetran_synced,
        created_date as created_at,
        last_modified_date as last_modified_at,
        name as display_name,
        sitetracker_actual_end_c as actual_end_at,
        sitetracker_actual_start_c as actual_start_at,
        sitetracker_all_day_event_c as is_all_day_event,
        sitetracker_constraint_date_c as constraint_at,
        sitetracker_constraint_type_c as constraint_type,
        sitetracker_description_c as description,
        sitetracker_duration_c as scheduled_duration,
        sitetracker_duration_unit_c as scheduled_duration_units,
        sitetracker_job_c as job_id,
        sitetracker_manually_scheduled_c as is_manually_scheduled,
        sitetracker_resource_c as resource_id,
        sitetracker_scheduled_end_c as scheduled_end_at,
        sitetracker_scheduled_start_c as scheduled_start_at,
        sitetracker_site_c as site_id,
        sitetracker_status_c as status,
        sitetracker_type_c as calendar_event_type
        
    from base

)

select *
from renamed
