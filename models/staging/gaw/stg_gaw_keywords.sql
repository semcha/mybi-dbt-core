{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_adwords') %}

with source as (

SELECT 

	  CAST([Идентификатор ключевого слова] AS BIGINT) AS [Идентификатор ключевого слова]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор ключевого слова]
	, [Ключевое слово]
	, [Конечная ссылка после редиректов]
	, [Статус ключевого слова]
	, [Стоимость показа на первой странице]
	, [Стоимость показа в верху страницы]

FROM {{ source('gaw', 'keywords') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source