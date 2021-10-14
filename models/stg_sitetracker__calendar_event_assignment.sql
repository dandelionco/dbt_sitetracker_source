with base as (

    select *
    from {{ ref('stg_sitetracker__calendar_event_assignment_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sitetracker__calendar_event_assignment_tmp')),
                staging_columns=get_calendar_event_assignment_columns()
            )
        }}

    from base

), final as (

    select
        _fivetran_synced,
        calendar_event_assignment_id,
        created_at,
        last_modified_at,
        display_name,
        calendar_event_id,
        mobile_display_name,
        resource_id,
        status

    from fields

)

select *
from final
