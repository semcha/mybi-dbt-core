
with source as (

select

      id
    , account_id
    , banner_id
    , title
    , text_content
    , other_content
    , system_status
    , status
    , moderation_status
    , moderation_reason
    , phone
    , url
    , urls

from {{ source('mytarget', 'banners') }}

{{ filter_rows(
    account_id=var('account_id_mytarget'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source