with base as (

    select *
    from {{ ref('stg_sitetracker__site_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sitetracker__site_tmp')),
                staging_columns=get_site_columns()
            )
        }}

    from base

), final as (

    select
        _fivetran_synced,
        site_id,
        created_at,
        last_modified_at,
        display_name,
        contact_id,
        territory_id

        --The below macro adds the fields defined within your sites_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('sites_pass_through_columns') }}

    from fields

)

select *
from final