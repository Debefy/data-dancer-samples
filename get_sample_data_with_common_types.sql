with data as (
  select
    cast(floor(rand() * 1000) as int64) as int_col,
    rand() * 1000 as float_col,
    case when rand() > 0.5 then true else false end as bool_col,
    cast(floor(rand() * 1000) as string) as string_col,
    date_add(current_date(), interval cast(floor(rand() * 365) as int64) day) as date_col,
    datetime_add(current_datetime(), interval cast(floor(rand() * 365) as int64) day) as datetime_col,
    timestamp_add(current_timestamp(), interval cast(floor(rand() * 365) as int64) day) as timestamp_col,
    cast(generate_uuid() as bytes) as bytes_col,
    time_add(current_time(), interval cast(floor(rand() * 3600) as int64) second) as time_col,
    st_geogpoint(
      -180 + ((rand() * 360)), 
      -90 + ((rand() * 180))  
    ) as geography_col,
    array<int64>[cast(floor(rand() * 10) as int64)] as array_col,
    struct<
      field1 int64,
      field2 string
    >(cast(floor(rand() * 100) as int64), 'value') as struct_col
  from
    unnest(generate_array(1, 100)) as row_number
)

select * from data;
