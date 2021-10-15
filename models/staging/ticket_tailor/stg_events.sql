with events as (

    select
      id as event_id,
      name as event_name,
      status,
      private::boolean as private_event,
      "START":unix::timestamp as start_time,
      "END":unix::timestamp as end_time,
      timezone,
      online_event::boolean as is_online_event,
      venue:name::string as venue,
      venue:postal_code::int as postal_code,
      tickets_available::boolean as tickets_available,
      total_issued_tickets,
      total_orders,
      ticket_types[0]:price::int as ticket_price,
      ticket_types[0]:status::string as ticket_status,
      ticket_types[0]:quantity::int as remaining_tickets,
      ticket_types[0]:max_per_order::int as max_tickets_per_order,
      ticket_types[0]:min_per_order::int as min_tickets_per_order
    from {{ source('ticket_tailor', 'events') }}

)

select * from events