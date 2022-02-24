{% macro rename_segments(column_name) %}
    CASE
        WHEN {{column_name}} in ('BULIDING', 'HOUSEHOLD', 'FURNITURE')
            THEN 'segments_1'
        ELSE 'segment_2'
    END 
{% endmacro %}