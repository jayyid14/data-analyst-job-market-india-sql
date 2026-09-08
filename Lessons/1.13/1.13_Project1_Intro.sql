SELECT 
    job_title_short,
    COUNT(*)
FROM 
    job_postings_fact
GROUP BY
    job_title_short
