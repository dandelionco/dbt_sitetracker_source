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
        last_modified_at,
        full_name,
        phone_number

        --The below macro adds the fields defined within your contacts_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('contacts_pass_through_columns') }}

    from fields

)

select *
from final
