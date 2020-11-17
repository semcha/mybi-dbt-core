{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_facebook') %}

with source as (

SELECT

	  [Идентификатор креатива]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор креатива]
	, Тело
	, [Тип call to action]
	, [Обрезанные изображения]
	, [URL изображения]
	, [URL списки]
	, [Название внешнего вида объявления]
	, [Идентификатор объекта]
	, [Идентификатор поста для объявления]
	, [Настройки поста для объявления]
	, [Целевой URL для объявления]
	, [Идентификатор миниатюры]
	, Заголовок
	, [Теги URL]
	, [Ссылка поста в Instagram]
	, [Тип рекламируемого объекта]
	, [Статус креатива]
	, [Шаблон ссылки]

FROM {{ source('facebook', 'creatives') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ( {{ account_id }} )

)

select * from source