

with source as (

select

      id
    , account_id
    , campaign_id
    , name
    , buying_type
    , configured_status
    , effective_status
    , objective
    , special_ad_category
    , bid_strategy

from {{ source('facebook', 'campaigns') }}

{{ filter_rows(
    account_id=var('account_id_facebook'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source