SELECT 
    sd.skills
    -- , count(jpf.salary_year_avg) as demand_count
    , round(median(jpf.salary_year_avg),0)  as median_salary
    , round(((median(jpf.salary_year_avg) * ln(count(jpf.salary_year_avg)))/1_000_000),2) as optimal_score
    , round(ln(count(jpf.salary_year_avg)),1) as ln_demand_count

From job_postings_fact as jpf
    inner join skills_job_dim as sjd
        on jpf.job_id = sjd.job_id
    inner join skills_dim as sd
        on sjd.skill_id = sd.skill_id
where 1=1 
    and jpf.job_title_short ='Data Engineer'
    and jpf.job_work_from_home = True
    and salary_year_avg is not null

group by 1 
having count(jpf.*) > 100
order by 3 desc
limit 30;  

/*
   skills   │ median_salary │ optimal_score │ ln_demand_count │
│  varchar   │    double     │    double     │     double      │
├────────────┼───────────────┼───────────────┼─────────────────┤
│ terraform  │      184000.0 │          0.97 │             5.3 │
│ python     │      135000.0 │          0.95 │             7.0 │
│ aws        │      137320.0 │          0.91 │             6.7 │
│ sql        │      130000.0 │          0.91 │             7.0 │
│ airflow    │      150000.0 │          0.89 │             6.0 │
│ spark      │      140000.0 │          0.87 │             6.2 │
│ snowflake  │      135500.0 │          0.82 │             6.1 │
│ kafka      │      145000.0 │          0.82 │             5.7 │
│ azure      │      128000.0 │          0.79 │             6.2 │
│ java       │      135000.0 │          0.77 │             5.7 │
│ scala      │      137290.0 │          0.76 │             5.5 │
│ kubernetes │      150500.0 │          0.75 │             5.0 │
│ git        │      140000.0 │          0.75 │             5.3 │
│ databricks │      132750.0 │          0.74 │             5.6 │
│ redshift   │      130000.0 │          0.73 │             5.6 │
│ gcp        │      136000.0 │          0.72 │             5.3 │
│ hadoop     │      135000.0 │          0.71 │             5.3 │
│ nosql      │      134415.0 │          0.71 │             5.3 │
│ pyspark    │      140000.0 │           0.7 │             5.0 │
│ docker     │      135000.0 │          0.67 │             5.0 │
│ mongodb    │      135750.0 │          0.67 │             4.9 │
│ r          │      134775.0 │          0.66 │             4.9 │
│ go         │      140000.0 │          0.66 │             4.7 │
│ github     │      135000.0 │          0.65 │             4.8 │
│ bigquery   │      135000.0 │          0.65 │             4.8 │
└────────────┴───────────────┴───────────────┴─────────────────┘
  25 rows                                            4 columns
*/