select * 
from var-dataset-bronze.landing_table t1
join var-dataset-silver.refined_table t2 
    on t1.id = t2.id