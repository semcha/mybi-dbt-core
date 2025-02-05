-- NON_EMPTY
{% macro test_not_empty(model, column_name) %}

with validation as (

    select
        count(1) as row_count

    from {{ model }}

),

validation_errors as (

    select
        row_count

    from validation
    where row_count = 0

)

select count(*)
from validation_errors

{% endmacro %}


-- UNIQUE
{% macro default__test_unique(model) %}

{% set column_name = kwargs.get('column_name', kwargs.get('arg')) %}

select count(*) as validation_errors
from (

    select
        {{ column_name }} as a

    from {{ model }}
    where {{ column_name }} is not null
    group by {{ column_name }}
    having count(*) > 1

) validation_errors

{% endmacro %}


{% macro test_unique(model) %}
    {% set macro = adapter.dispatch('test_unique') %}
    {{ macro(model, **kwargs) }}
{% endmacro %}