with tickets as (

  select * from {{ source('ticket_tailor', 'issued_tickets') }}

),

final as (

  select
    id as ticket_id,
    event_id,
    order_id,
    ticket_type_id,
    barcode,
    barcode_url,
    created_at::timestamp as created_at,
    status,
    updated_at::timestamp as updated_at,
    voided_at::timestamp as voided_at,
    _sdc_batched_at
  from tickets

)

select * from final