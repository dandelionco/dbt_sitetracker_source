{% macro get_site_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "id", "datatype": dbt.type_int(), "alias": "site_id"},
    {"name": "created_date", "datatype": dbt.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt.type_timestamp(),"alias":"last_modified_at"},
    {"name": "name", "datatype": dbt.type_string(), "alias":"display_name"},
    {"name": "contact_c", "datatype": dbt.type_string(), "alias":"contact_id"},
    {"name": "sitetracker_territory_c", "datatype": dbt.type_string(), "alias": "territory_id"}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('sites_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}