select * 
from @@bronze.landing_table t1
join @@silver.refined_table t2 
    on t1.id = t2.id
