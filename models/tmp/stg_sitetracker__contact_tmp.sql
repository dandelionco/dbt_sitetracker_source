select *
from {{ var('contact') }}
where not coalesce(
    is_deleted,
    false
)