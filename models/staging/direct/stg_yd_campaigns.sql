{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_direct') %}

with source as (

SELECT

	  [Идентификатор кампании]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор кампании]
	, [Название кампании]
	, [Тип кампании]
	, [Статус кампании]
	, [Состояние кампании]
	, [Статус оплаты кампании]
	, [Текстовое пояснение к статусу]
	, [Валюта кампании]
	, [Дневной бюджет кампании]
	, [Тип дневного бюджета]
	, [Дата начала актуальности записи]
	, [Дата окончания актуальности записи]
	, [Признак актуальности записи]

FROM {{ source('direct', 'campaigns') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ({{ account_id }})

)

select * from source