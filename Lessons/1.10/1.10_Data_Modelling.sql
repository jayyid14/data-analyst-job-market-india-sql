SELECT 
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM 
    job_postings_fact
LIMIT 10;

SELECT 
    company_id,
    name
FROM 
    company_dim
LIMIT 10;


CREATE VIEW high_paying_jobs AS
FROM 
    job_postings_fact
WHERE 
    salary_year_avg >=200_000;

SELECT *
FROM
    company_dim
LIMIT 10;

SELECT *
FROM    
    company_dim
WHERE 
    NAME IN ('Google', 'Meta');


SELECT *
FROM skills_job_dim
LIMIT 5;

SELECT *
FROM 
    skills_dim
LIMIT 5;

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'data_jobs';

SELECT *
FROM information_schema.columns
WHERE table_catalog = 'data_jobs';

SELECT *
FROM information_schema.table_constraints
WHERE table_catalog = 'data_jobs';

SELECT *
FROM information_schema.key_column_usage
WHERE table_catalog = 'data_jobs';
