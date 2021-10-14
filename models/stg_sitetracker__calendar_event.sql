with base as (

    select *
    from {{ ref('stg_sitetracker__calendar_event_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sitetracker__calendar_event_tmp')),
                staging_columns=get_calendar_event_columns()
            )
        }}

    from base

), final as (

    select
        _fivetran_synced,
        calendar_event_id,
        created_at,
        last_modified_at,
        display_name,
        calendar_event_type
        description,
        status,
        is_all_day_event,
        actual_end_at,
        actual_start_at,
        is_manually_scheduled,
        scheduled_duration,
        scheduled_duration_units,
        scheduled_end_at,
        scheduled_start_at,
        resource_id,
        job_id,
        site_id,

    from fields

)

select *
from final
