with base as (

    select *
    from {{ ref('stg_sitetracker__contact_tmp') }}

), fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_sitetracker__contact_tmp')),
                staging_columns=get_contact_columns()
            )
        }}

    from base

), final as (

    select
        _fivetran_synced,
        contact_id,
        created_at,
        email,
        cast(crm_contact_id as int64) as crm_contact_id,
        last_modified_at,
        full_name,
        phone_number

    from fields

)

select *
from final
