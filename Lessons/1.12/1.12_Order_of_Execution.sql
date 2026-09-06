/*
Find the top 10 companies for posting jobs.
They must have >3000 postings

*/
SELECT 
    cd.name AS company_name,
    COUNT(*) AS job_count
FROM 
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
GROUP BY
    cd.name
HAVING
    COUNT(*) > 3000
ORDER BY 
    COUNT(*) DESC;

