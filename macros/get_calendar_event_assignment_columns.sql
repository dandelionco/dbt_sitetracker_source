{% macro get_calendar_event_assignment_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string(), "alias": "calendar_event_assignment_id"},
    {"name": "created_date", "datatype": dbt_utils.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt_utils.type_timestamp(),"alias":"last_modified_at"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias": "display_name"},
    {"name": "sitetracker_calendar_event_c", "datatype": dbt_utils.type_string(), "alias": "calendar_event_id"},
    {"name": "sitetracker_mobile_name_c", "datatype": dbt_utils.type_string(), "alias": "mobile_display_name"},
    {"name": "sitetracker_resource_c", "datatype": dbt_utils.type_string(), "alias": "resource_id"},
    {"name": "sitetracker_status_c", "datatype": dbt_utils.type_string(), "alias": "status"}
] %}

{{ return(columns) }}

{% endmacro %}