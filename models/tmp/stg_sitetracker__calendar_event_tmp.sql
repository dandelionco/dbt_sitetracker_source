select *
from {{ var('calendar_event') }}
where not coalesce(
    is_deleted,
    false
)