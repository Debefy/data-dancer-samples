create or replace table var-dataset-bronze.landing_table
(
    id int64,
    name string,
    age int64,
    date_of_birth date,
    timestamp timestamp,
    is_active bool,
    is_deleted bool,
    created_at timestamp,
    updated_at timestamp
)
cluster by id