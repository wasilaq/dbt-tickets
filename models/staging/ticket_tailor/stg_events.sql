with events as (

  select * from {{ source('ticket_tailor', 'events') }}

),

final as (

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
    ticket_types[0]:min_per_order::int as min_tickets_per_order,
    ticket_types[0]:access_code as access_code,
    ticket_types[0]:booking_fee as booking_fee,
    ticket_types[0]:description as ticket_type_description,
    ticket_types[0]:group_id as group_id,
    ticket_types[0]:id as ticket_type_id,
    ticket_types[0]:name as ticket_type_name,
    ticket_types[0]:objest as ticket_type_object,
    ticket_types[0]:quantity as ticket_quantity,
    ticket_types[0].sort_order as ticket_type_sort_order,
    ticket_types[0].status as ticket_type_status,
    ticket_types[0].type as ticket_type,
    call_to_action,
    created_at::timestamp as created_at,
    currency,
    description,
    images:header as image_header,
    images:thumbnail as image_thumbnail,
    payment_methods, -- left in json format since array has the potential to varying number of payment methods
    ticket_groups,
    url,
    _sdc_batched_at,
    _sdc_received_at,
    _sdc_sequence,
    _sdc_table_version
  from events

)

select * from final