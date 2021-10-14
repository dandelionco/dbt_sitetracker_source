with base as (

    select *
    from {{ ref('stg_sitetracker__timesheet_user_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sitetracker__timesheet_user_tmp')),
                staging_columns=get_timesheet_user_columns()
            )
        }}

    from base

), final as (

    select
        _fivetran_synced,
        timesheet_user_id,
        created_date as created_at,
        last_modified_date as last_modified_at,
        crew_resource_type,
        display_name,
        is_active,
        calendar_id,
        territory_id,
        timesheet_user_type,
        user_id

    from fields

)

select *
from final