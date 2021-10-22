select
  refund_amount
from {{ source('ticket_tailor', 'orders') }}
where refund_amount < 0