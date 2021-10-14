{% macro get_contact_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string(), "alias": "contact_id"},
    {"name": "created_date", "datatype": dbt_utils.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt_utils.type_timestamp(),"alias":"last_modified_at"},
    {"name": "hub_spot_contact_id_c", "datatype": dbt_utils.type_string(),"alias":"crm_contact_id"},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias":"full_name"},
    {"name": "phone", "datatype": dbt_utils.type_string(), "alias":"phone_number"},
    
] %}

{{ return(columns) }}

{% endmacro %}