with orders as (

  select 
    id as order_id,
    status,
    line_items[0]:booking_fee::int as booking_fee,
    line_items[0]:value::int as cost,
    line_items[0]:quantity::int as quantity,
    line_items[0]:total::int as total_cost,
    total + tax as total_cost_plus_tax,
    refund_amount,
    currency:code::string as currency,
    line_items[0]:type::string as item_type,
    event_summary:id::string as event_id,
    event_summary:name::string as event_name,
    event_summary:start_date.unix::timestamp as start_date,
    event_summary:end_date.unix::timestamp as end_date
  from {{ source('ticket_tailor', 'orders') }}

)

select * from orders