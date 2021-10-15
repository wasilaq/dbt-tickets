with tickets as (
    select
      id as ticket_id,
      event_id,
      order_id,
      case when status = 'valid' then 'purchased'
      when status = 'voided' then 'returned'
      end as status
    from {{ source('ticket_tailor', 'issued_tickets') }}
)

select * from tickets