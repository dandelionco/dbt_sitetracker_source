{% macro get_site_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int(), "alias": "site_id"},
    {"name": "created_date", "datatype": dbt_utils.type_timestamp(),"alias":"created_at"},
    {"name": "last_modified_date", "datatype": dbt_utils.type_timestamp(),"alias":"last_modified_at"},
    {"name": "name", "datatype": dbt_utils.type_string(), "alias":"display_name"},
    {"name": "hub_spot_deal_id_c", "datatype": dbt_utils.type_string(), "alias":"deal_id"},
    {"name": "contact_c", "datatype": dbt_utils.type_string(), "alias":"contact_id"},
    {"name": "sitetracker_territory_c", "datatype": dbt_utils.type_string(), "alias": "territory_id"}
] %}

{{ return(columns) }}

{% endmacro %}