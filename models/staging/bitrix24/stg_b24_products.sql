{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_b24') %}

with source as (

SELECT

	[Идентификатор товара]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор товара]
	, [Название продукта]
	, [Исходное название продукта]
	, [Описание продукта]
	, [Название единицы измерения]
	, [Процент налога]
	, [Налог включен]

FROM {{ source('bitrix24', 'products') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] = {{ account_id }}

)

select * from source