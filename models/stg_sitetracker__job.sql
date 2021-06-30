with base as (

    select *
    from {{ var('job') }}
    where not coalesce(
        is_deleted,
        false
    )

), renamed as (

    select
        id as job_id,
        _fivetran_synced,
        created_date as created_at,
        last_modified_date as last_modified_at,
        name as display_name,
        sitetracker_actual_end_c as actual_end_at,
        sitetracker_actual_start_c as actual_start_at,
        sitetracker_description_c as description,
        sitetracker_duration_c as scheduled_duration,
        sitetracker_duration_unit_c as scheduled_duration_units,
        sitetracker_job_number_c as job_number,
        sitetracker_job_c as job_id,
        sitetracker_status_c as status,
        sitetracker_job_template_c as job_template_id,
        sitetracker_job_type_c as job_type,
        sitetracker_scheduled_end_c as scheduled_end_at,
        sitetracker_scheduled_start_c as scheduled_start_at,
        sitetracker_site_c as site_id,
        sitetracker_territory_c as territory_id
        
    from base

)

select *
from renamed
