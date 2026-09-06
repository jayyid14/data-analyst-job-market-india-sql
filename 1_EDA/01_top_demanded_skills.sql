/*
Question: What are the most in-demand skills for data analysts?
- Identify the top 10 in-demand skills for data analysts
- Focus on job postings in India
- Why? Retrieves the top 10 skills with the highest demand in the Indian job market, providing insights
  into the most valuable skills for data analysts seekings jobs.
*/

SELECT 
    sd.skills,
    COUNT(*) AS demand_count
FROM job_postings_fact as jpf 
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Analyst'
    AND
    jpf.job_country = 'India'
GROUP BY 
    sd.skills
ORDER BY 
    demand_count DESC
LIMIT 10;

/*
Here's the breakdown of the most in-demand skills for data analysts:

SQL is clearly the most in-demand skill, appearing in 7,626 job postings.
Python and Excel follow with 5,393 and 4,931 postings, showing that
programming and spreadsheet skills are both important for data analyst roles.

Tableau and Power BI are also highly requested, with 3,941 and 3,316
postings respectively, highlighting the importance of data visualization
and BI tools.

R and SAS appear in fewer postings but are still fairly common, while
cloud platforms like Azure and AWS show up further down the list.
PowerPoint rounds out the top 10.

Key takeaways:

- SQL is by far the most requested skill for data analyst roles
- Python and Excel are also highly valuable and widely requested
- Tableau and Power BI show strong demand for visualization and BI
- R and SAS are still relevant, although less common than SQL/Python/Excel
- Cloud skills such as Azure and AWS appear in the top 10
- PowerPoint also appears in the top 10, showing that communication and
  presenting insights can be part of the data analyst role as well

┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │         7626 │
│ python     │         5393 │
│ excel      │         4931 │
│ tableau    │         3941 │
│ power bi   │         3316 │
│ r          │         2328 │
│ sas        │         1874 │
│ azure      │         1354 │
│ aws        │         1158 │
│ powerpoint │          871 │
└────────────┴──────────────┘
  10 rows         2 columns

*/
