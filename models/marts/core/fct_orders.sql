with orders as (

    select * from {{ ref('stg_orders') }}

),

final as (

    select
        *,

        case when refund_amount > 0
        then true
        else false
        end as refunded_order
        
    from orders

)

select * from final