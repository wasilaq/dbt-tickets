with tickets as (
    select
      id as ticket_id,
      event_id,
      order_id,
      status
    from {{ source('ticket_tailor', 'issued_tickets') }}
)

select * from tickets