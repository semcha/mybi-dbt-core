{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_b24') %}

with source as (

SELECT

	[Идентификатор подключенного аккаунта]
	, [Идентификатор клиента]
	, [Идентификатор источника трафика]
	, [Идентификатор пользователя]
	, [Идентификатор сделки]
	, [Идентификатор контакта]
	, [Идентификатор компании]
	, [Идентификатор местоположения]
	, [Дата открытия сделки]
	, [Дата закрытия сделки]
	, [Идентификатор товара]
	, Количество
	, Сумма
	, [Сумма скидки]

FROM {{ source('bitrix24', 'products_facts') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] = {{ account_id }}

)

select * from source