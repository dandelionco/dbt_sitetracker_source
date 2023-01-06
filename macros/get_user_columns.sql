{% macro get_user_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_string(), "alias": "user_id"},
    {"name": "created_date", "datatype": dbt.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt.type_timestamp(),"alias":"last_modified_at"},
    {"name": "is_active", "datatype": "boolean"},
    {"name": "first_name", "datatype": dbt.type_string()},
    {"name": "last_name", "datatype": dbt.type_string()},
    {"name": "name", "datatype": dbt.type_string(), "alias":"full_name"},
    {"name": "email", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}