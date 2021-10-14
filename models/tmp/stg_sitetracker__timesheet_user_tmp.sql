select *
from {{ var('timesheet_user') }}
where not coalesce(
    is_deleted,
    false
)