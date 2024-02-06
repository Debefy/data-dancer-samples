create or replace procedure @bronze.get_maximum_overdrive()
begin
    select 
        case when @maximum_overdrive 
            then 'Maximum Overdrive'
            else 'Not Maximum Overdrive' end as message,
        @maximum_overdrive as maximum_overdrive,
        current_timestamp() as current_time;
end

