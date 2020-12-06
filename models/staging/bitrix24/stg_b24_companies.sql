{{
    config({
        "materialized": 'view'
    })
}}

{% set account_id = var('account_id_b24') %}

with source as (

SELECT

	[Идентификатор компании]
	, [Идентификатор подключенного аккаунта]
	, [Внутренний идентификатор компании]
	, [Тип компании]
	, [Название компании]
	, [Юридический адрес]
	, [Банковские реквизиты]
	, [Сфера деятельности]
	, [Количество сотрудников]
	, [Годовой оборот]
	, Комментарии
	, Телефон
	, [Адрес электронной почты]
	, Сайт
	, [Служба сообщений]
	, [Компания удалена]

FROM {{ source('bitrix24', 'companies') }}

WHERE 1=1
	AND [Идентификатор подключенного аккаунта] in ({{ account_id }})

)

select * from source