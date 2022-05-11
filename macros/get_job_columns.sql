{% macro get_job_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string(), "alias": "job_id"},
    {"name": "created_date", "datatype": dbt_utils.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt_utils.type_timestamp(),"alias":"last_modified_at"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias":"display_name"},
    {"name": "sitetracker_actual_end_c", "datatype": dbt_utils.type_timestamp(), "alias": "actual_end_at"},
    {"name": "sitetracker_actual_start_c", "datatype": dbt_utils.type_timestamp(), "alias": "actual_start_at"},
    {"name": "sitetracker_description_c", "datatype": dbt_utils.type_string(), "alias": "description"},
    {"name": "sitetracker_estimated_duration_c", "datatype": dbt_utils.type_int(), "alias": "scheduled_duration"},
    {"name": "sitetracker_duration_unit_c", "datatype": dbt_utils.type_string(), "alias": "scheduled_duration_units"},
    {"name": "sitetracker_job_number_c", "datatype": dbt_utils.type_string(), "alias": "job_number"},
    {"name": "sitetracker_job_status_c", "datatype": dbt_utils.type_string(), "alias": "status"},
    {"name": "sitetracker_job_template_c", "datatype": dbt_utils.type_string(), "alias": "job_template_id"},
    {"name": "sitetracker_job_type_c", "datatype": dbt_utils.type_string(), "alias": "job_type"},
    {"name": "sitetracker_scheduled_end_c", "datatype": dbt_utils.type_timestamp(), "alias": "scheduled_end_at"},
    {"name": "sitetracker_scheduled_start_c", "datatype": dbt_utils.type_timestamp(), "alias": "scheduled_start_at"},
    {"name": "sitetracker_site_c", "datatype": dbt_utils.type_string(), "alias": "site_id"},
    {"name": "sitetracker_territory_c", "datatype": dbt_utils.type_string(), "alias": "territory_id"}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('jobs_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}