select *
from {{ var('calendar_event_assignment') }}
where not coalesce(
    is_deleted,
    false
)