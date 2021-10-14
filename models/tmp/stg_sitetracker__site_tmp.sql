select *
from {{ var('site') }}
where not coalesce(
    is_deleted,
    false
)