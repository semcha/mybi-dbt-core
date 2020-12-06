{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_direct') %}

with source as (

SELECT 

	  [Идентификатор подключенного аккаунта]
	, [Идентификатор кампании]
	, [Идентификатор группы объявлений]
	, [Идентификатор объявления]
	, [Идентификатор даты]
	, [Идентификатор сайта]
	, [Идентификатор источника трафика]
	, [Тип устройства]
	, [Показы в рекламной сети]
	, [Показы на поиске]
	, Показы
	, [Клики в рекламной сети]
	, [Клики на поиске]
	, Клики
	, [Расходы в рекламной сети]
	, [Расходы на поиске]
	, Расходы
	, [Средняя позиция показов]
	, [Средняя позиция кликов]
	, Отказы
	, Дата

FROM {{ source('direct', 'ads_facts') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ({{ account_id }})

)

select * from source