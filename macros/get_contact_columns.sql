{% macro get_contact_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string(), "alias": "contact_id"},
    {"name": "created_date", "datatype": dbt_utils.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt_utils.type_timestamp(),"alias":"last_modified_at"},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias":"full_name"},
    {"name": "phone", "datatype": dbt_utils.type_string(), "alias":"phone_number"},
    
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('contacts_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}