select *
from {{ var('job') }}
where not coalesce(
    is_deleted,
    false
)