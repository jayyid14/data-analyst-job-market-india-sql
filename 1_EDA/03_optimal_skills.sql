/*
Question: What are the most optimal skills for data analysts-balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valualbe skills
- Focus on job postings in India
- Why? This approach highlights the skills that balance market demand and financial reward. It weighs core 
  skills appropriately, rather than letting rare, outlier skills distort the result
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
    COUNT(*) AS demand_count,
    ROUND(LN(COUNT(*)), 1) AS ln_demand_count,
    ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(*)))/500_000, 2) AS optimal_score
FROM job_postings_fact as jpf 
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Analyst'
    AND
    jpf.job_country = 'India'
    AND
    jpf.salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING 
    COUNT(*) > 10
ORDER BY 
    optimal_score DESC
LIMIT 25;

/*
Here's a breakdown of the most optimal skills for Data Analysts in India,
based on a balance of salary and demand:

Key Insights:

- SQL ranks as the most optimal skill overall. It has the highest demand
  among the listed skills with 106 postings, while also offering a solid
  median salary of $79.2K.

- Python and Excel follow closely behind SQL. Both have the same median
  salary of $79.2K, but Python has slightly higher demand than Excel,
  which gives it a slightly higher optimal score.

- Spark and PowerPoint both stand out with much higher median salaries of
  about $111.2K. Spark appears in 18 postings while PowerPoint appears in 
  15,yet both still rank highly because of their stronger salary levels.

- R, Tableau and Power BI have stronger demand than several of the
  higher-paying tools, but their lower median salaries reduce their
  overall optimal scores.

- Looker, Azure and Word also rank reasonably well, but for different 
  reasons: Looker and Word benefit more from higher median salaries, 
  while Azure benefits from stronger demand.

Takeaway:

SQL, Python and Excel appear to offer the strongest overall balance of
salary and demand for Data Analyst roles in India. However, skills such
as Spark and PowerPoint show that a lower-demand skill can still rank
highly when it is associated with significantly higher salaries.


┌────────────┬───────────────┬──────────────┬─────────────────┬───────────────┐
│   skills   │ median_salary │ demand_count │ ln_demand_count │ optimal_score │
│  varchar   │    double     │    int64     │     double      │    double     │
├────────────┼───────────────┼──────────────┼─────────────────┼───────────────┤
│ sql        │       79200.0 │          106 │             4.7 │          0.74 │
│ python     │       79200.0 │           76 │             4.3 │          0.69 │
│ excel      │       79200.0 │           69 │             4.2 │          0.67 │
│ spark      │      111175.0 │           18 │             2.9 │          0.64 │
│ powerpoint │      111175.0 │           15 │             2.7 │           0.6 │
│ r          │       79200.0 │           36 │             3.6 │          0.57 │
│ tableau    │       73500.0 │           43 │             3.8 │          0.55 │
│ looker     │       98500.0 │           15 │             2.7 │          0.53 │
│ azure      │       79200.0 │           23 │             3.1 │           0.5 │
│ word       │       89118.0 │           15 │             2.7 │          0.48 │
│ power bi   │       64650.0 │           34 │             3.5 │          0.46 │
│ oracle     │       77134.0 │           18 │             2.9 │          0.45 │
│ sap        │       83600.0 │           12 │             2.5 │          0.42 │
│ aws        │       64272.0 │           25 │             3.2 │          0.41 │
└────────────┴───────────────┴──────────────┴─────────────────┴───────────────┘
  14 rows                                                           5 columns

*/