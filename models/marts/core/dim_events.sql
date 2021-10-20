with events as (    

  select * from {{ ref('stg_events') }}

),

final as (

  select
    event_id,
    event_name,
    status,
    private_event,
    start_time,
    end_time,
    timezone,
    is_online_event,
    venue,
    postal_code,
    tickets_available,
    total_issued_tickets,
    total_orders,
    ticket_price,
    currency,
    ticket_status,
    remaining_tickets,
    max_tickets_per_order,
    min_tickets_per_order,
    ticket_type_id,
    ticket_quantity,
    ticket_type_status
  from events

)

select * from final