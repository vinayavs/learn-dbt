{% macro suspend(warehouse_name) %}

  {% set sql %}
    alter warehouse {{warehouse_name}} suspend
  {% endset %}

  {% set table = run_query(sql) %}
  {% do table.print_table() %}

{% endmacro %}


-- dbt run-operation suspend --args '{warehouse_name: transform_wh}'