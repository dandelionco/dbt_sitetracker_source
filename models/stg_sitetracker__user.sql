with base as (

    select *
    from {{ ref('stg_sitetracker__user_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sitetracker__user_tmp')),
                staging_columns=get_user_columns()
            )
        }}

    from base

), final as (

    select
        _fivetran_synced,
        user_id,
        created_at,
        last_modified_at,
        is_active,
        first_name,
        last_name,
        email,
        full_name

    from fields

)

select *
from final