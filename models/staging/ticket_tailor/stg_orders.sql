with orders as (

  select * from {{ source('ticket_tailor', 'orders') }}
  
),

final as (

  select 
    id as order_id,
    status as order_status,
    line_items[0]:booking_fee::int as booking_fee,
    line_items[0]:value::int as cost,
    line_items[0]:quantity::int as quantity,
    line_items[0]:total::int as total_cost,
    subtotal,
    tax,
    txn_id,
    refund_amount,
    currency:code::string as currency,
    currency:base_multiplier as currency_base_multiplier,
    line_items[0]:type::string as line_item_type,
    line_items[0]:description as line_item_description,
    line_items[0]:id as line_item_id,
    line_items[0]:object as line_item_object,
    event_summary:id::string as event_id,
    event_summary:name as event_name,
    event_summary:start_date.unix::timestamp as event_start_time,
    event_summary:end_date.unix::timestamp as event_end_time,
    created_at::timestamp as created_at,
    _sdc_batched_at,
    _sdc_received_at,
    _sdc_sequence,
    _sdc_table_version

  from orders

)

select * from final