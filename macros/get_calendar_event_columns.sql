{% macro get_calendar_event_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_string(), "alias": "calendar_event_id"},
    {"name": "created_date", "datatype": dbt.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt.type_timestamp(),"alias":"last_modified_at"},
    {"name": "name", "datatype": dbt.type_string(), "alias": "display_name"},
    {"name": "sitetracker_actual_end_c", "datatype": dbt.type_timestamp(), "alias": "actual_end_at"},
    {"name": "sitetracker_actual_start_c", "datatype": dbt.type_timestamp(), "alias": "actual_start_at"},
    {"name": "sitetracker_all_day_event_c", "datatype": "boolean", "alias": "is_all_day_event"},
    {"name": "sitetracker_description_c", "datatype": dbt.type_string(), "alias": "description"},
    {"name": "sitetracker_duration_c", "datatype": dbt.type_int(), "alias": "scheduled_duration"},
    {"name": "sitetracker_duration_unit_c", "datatype": dbt.type_string(), "alias": "scheduled_duration_units"},
    {"name": "sitetracker_job_c", "datatype": dbt.type_string(), "alias": "job_id"},
    {"name": "sitetracker_manually_scheduled_c", "datatype": "boolean", "alias": "is_manually_scheduled"},
    {"name": "sitetracker_resource_c", "datatype": dbt.type_string(), "alias": "resource_id"},
    {"name": "sitetracker_scheduled_end_c", "datatype": dbt.type_timestamp(), "alias": "scheduled_end_at"},
    {"name": "sitetracker_scheduled_start_c", "datatype": dbt.type_timestamp(), "alias": "scheduled_start_at"},
    {"name": "sitetracker_site_c", "datatype": dbt.type_string(), "alias": "site_id"},
    {"name": "sitetracker_status_c", "datatype": dbt.type_string(), "alias": "status"},
    {"name": "sitetracker_type_c", "datatype": dbt.type_string(), "alias": "calendar_event_type"}
] %}

{{ return(columns) }}

{% endmacro %}
