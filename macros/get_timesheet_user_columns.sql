{% macro get_timesheet_user_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string(), "alias": "contact_id"},
    {"name": "created_date", "datatype": dbt_utils.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt_utils.type_timestamp(),"alias":"last_modified_at"},
    {"name": "crew_resource_type_c", "datatype": dbt_utils.type_string(),"alias":"crew_resource_type"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias":"display_name"},
    {"name": "sitetracker_active_c", "datatype": "boolean", "alias":"is_active"},
    {"name": "sitetracker_calendar_c", "datatype": dbt_utils.type_string(), "alias":"calendar_id"},
    {"name": "sitetracker_territory_c", "datatype": dbt_utils.type_string(), "alias":"territory_id"},
    {"name": "sitetracker_type_c", "datatype": dbt_utils.type_string(), "alias":"timesheet_user_type"},
    {"name": "sitetracker_user_c", "datatype": dbt_utils.type_string(), "alias":"user_id"}
] %}

{{ return(columns) }}

{% endmacro %}