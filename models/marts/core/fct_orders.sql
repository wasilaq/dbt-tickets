with orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        id,
        order_status,
        booking_fee,
        cost,
        quantity,
        total_cost,
        total_cost + tax as total_cost_plus_tax,
        currenct,
        item_type,
        event_id,        

        case when refund_amount > 0
        then true
        else false
        end as refunded_order
        
    from orders

)

select * from final