SELECT 
    job_country,
    job_title_short,
    AVG(salary_year_avg) AS average_salary
FROM job_postings_fact
WHERE 
    job_work_from_home = TRUE
    AND
    salary_year_avg IS NOT NULL
GROUP BY
    job_country,
    job_title_short
ORDER BY
    job_country ASC,
    AVG(salary_year_avg) DESC;
