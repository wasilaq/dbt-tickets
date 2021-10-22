select 
  cost * quantity as correct_total_cost,
  total_cost

from {{ ref('stg_orders') }}
where correct_total_cost != total_cost