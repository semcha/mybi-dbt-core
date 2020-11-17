{{
    config({
        "materialized": 'view'
    })
}}

with source as (

SELECT

	[Идентификатор записи]
	, [Идентификатор подключенного аккаунта]
	, [Название источника]
	, Сервис
	, Включен
	, [Статус загрузки]
	, [Дата начала интервала]
	, [Дата окончания интервала]

FROM {{ source('general', 'accounts') }}

WHERE 1=1

)

select * from source