# SiteTracker (Source)

This package models SiteTracker data by doing the following:

* Adds descriptions to tables and columns that are synced using Fivetran.
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.

## Models

This package contains staging models:

* Remove any rows that are soft-deleted.
* Name columns consistently across all packages:
* Boolean fields are prefixed with `is_` or `has_`.
* Timestamps are appended with `_at`.
* ID primary keys are prefixed with the name of the table. For example, the user table's ID column is renamed `user_id`.

## Configuration
By default this package will look for your SiteTracker data in the `sitetracker` schema of your [target database](https://docs.getdbt.com/docs/running-a-dbt-project/using-the-command-line-interface/configure-your-profile).
