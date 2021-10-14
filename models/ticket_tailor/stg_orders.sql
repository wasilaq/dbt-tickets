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
    event_summary:id::string as event_id
  from {{ source('ticket_tailor', 'orders') }}

)

select * from orders