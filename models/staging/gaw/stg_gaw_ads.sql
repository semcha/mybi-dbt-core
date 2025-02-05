

with source as (

select 

      id
    , account_id
    , ad_id
    , url
    , display_url
    , final_urls
    , tracking_url_template
    , url_custom_parameters
    , type
    , headline
    , headline_part_one
    , headline_part_two
    , description
    , description_part_one
    , description_part_two
    , path_one
    , path_two
    , status
    , approval_status
    , phone_number

from {{ source('gaw', 'ads') }}

{{ filter_rows(
    account_id=var('account_id_adwords'),
    last_number_of_days=false, 
    ts_field=none
) }}

)

select * from source