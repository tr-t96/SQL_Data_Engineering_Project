SELECT 
    sd.skills
    , count(*) as demand_count
    , round(median(jpf.salary_year_avg),0)  as median_salary
From job_postings_fact as jpf
    inner join skills_job_dim as sjd
        on jpf.job_id = sjd.job_id
    inner join skills_dim as sd
        on sjd.skill_id = sd.skill_id
where 1=1 
    and jpf.job_title_short ='Data Engineer'
    and jpf.job_work_from_home = True 
group by 1 
having count(*) > 100
order by 3 desc
limit 25; 

/*
────────────┬──────────────┬───────────────┐
│   skills   │ demand_count │ median_salary │
│  varchar   │    int64     │    double     │
├────────────┼──────────────┼───────────────┤
│ rust       │          232 │      210000.0 │
│ golang     │          912 │      184000.0 │
│ terraform  │         3248 │      184000.0 │
│ spring     │          364 │      175500.0 │
│ neo4j      │          277 │      170000.0 │
│ gdpr       │          582 │      169616.0 │
│ zoom       │          127 │      168438.0 │
│ graphql    │          445 │      167500.0 │
│ mongo      │          265 │      162250.0 │
│ fastapi    │          204 │      157500.0 │
│ django     │          265 │      155000.0 │
│ bitbucket  │          478 │      155000.0 │
│ crystal    │          129 │      154224.0 │
│ c          │          444 │      151500.0 │
│ atlassian  │          249 │      151500.0 │
│ typescript │          388 │      151000.0 │
│ kubernetes │         4202 │      150500.0 │
│ node       │          179 │      150000.0 │
│ css        │          262 │      150000.0 │
│ airflow    │         9996 │      150000.0 │
│ ruby       │          736 │      150000.0 │
│ redis      │          605 │      149000.0 │
│ vmware     │          136 │      148798.0 │
│ ansible    │          475 │      148798.0 │
│ jupyter    │          400 │      147500.0 │
└────────────┴──────────────┴───────────────┘
  25 rows                         3 columns
*/