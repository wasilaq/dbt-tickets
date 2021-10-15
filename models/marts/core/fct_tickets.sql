with tickets as (

    select
      ticket_id,
      case when status = 'valid' then 'purchased'
      when status = 'voided' then 'returned'
      end as status,
      event_id
    from {{ ref('stg_issued_tickets') }}

),

events as (

    select
      ticket_price,
      ticket_status,
      event_name,
      private_event,
      start_time,
      end_time,
      timezone,
      is_online_event,
      venue,
      postal_code,
      event_id
    from {{ ref('stg_events') }}

)


select
    ticket_id,
    status,
    ticket_price,
    ticket_status,
    events.event_id as event_id,
    event_name,
    start_time,
    end_time,
    timezone,
    private_event,
    is_online_event,
    venue,
    postal_code
from tickets
left join events
on tickets.event_id = events.event_id