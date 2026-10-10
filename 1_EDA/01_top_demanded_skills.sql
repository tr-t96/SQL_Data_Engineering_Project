SELECT 
    sd.skills
    , count(*) as demand_count
From job_postings_fact as jpf
    inner join skills_job_dim as sjd
        on jpf.job_id = sjd.job_id
    inner join skills_dim as sd
        on sjd.skill_id = sd.skill_id
where 1=1 
    and jpf.job_title_short ='Data Engineer'
    and jpf.job_work_from_home = True 
group by 1 
order by 2 desc
limit 10; 

/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
*/