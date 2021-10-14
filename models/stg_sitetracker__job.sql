with base as (

    select *
    from {{ ref('stg_sitetracker__job_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sitetracker__job_tmp')),
                staging_columns=get_job_columns()
            )
        }}

    from base

), final as (

    select
        _fivetran_synced,
        job_id,
        created_at,
        last_modified_at,
        display_name,
        actual_end_at,
        actual_start_at,
        description,
        scheduled_duration,
        scheduled_duration_units,
        job_number,
        status,
        job_template_id,
        job_type,
        scheduled_end_at,
        scheduled_start_at,
        site_id,
        territory_id

    from fields

)

select *
from final