with tickets as (
  
  select * from {{ ref('stg_issued_tickets') }}

),

events as (

  select * from {{ ref('dim_events') }}

),

orders as (

  select * from {{ ref('fct_orders') }}

),

final as (
  
  select
    tickets.ticket_id,
    orders.order_id,
    tickets.status,
    orders.refunded_order as refunded_ticket,
    events.ticket_price,
    events.ticket_status,
    events.event_id as event_id,
    events.event_name,
    events.start_time,
    events.end_time,
    events.timezone,
    events.private_event,
    events.is_online_event,
    events.venue,
    events.postal_code
  from tickets
  left join events
  on tickets.event_id = events.event_id
  left join orders
  on tickets.order_id = orders.order_id

)

select * from final