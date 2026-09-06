/*
Question: What are the highest-paying skills for data analysts?
- Calculate the median salary for each skill required in data analyst position
- Focus on job postings in India
- Include skill frequency to identify both salary and demand
- Why? Helps identify which skills command the highest compensation while also showing how 
  common those skills are, providing a more complete picture for skill development priorities
*/

SELECT 
    sd.skills,
    ROUND(MEDIAN(jpf.salary_year_avg), 0) AS median_salary,
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
HAVING 
    COUNT(*) > 100
ORDER BY 
    median_salary DESC
LIMIT 25;


/*
Here's a breakdown of the highest-paying skills for Data Analysts in India:

Key Insights:

- Linux has the highest median salary at $165K, but appears in only 112 job postings,
  so its demand is relatively limited compared with some of the other skills.

- MongoDB and GDPR follow closely, both with median salaries of about $163.8K.
  MongoDB appears in 224 postings, while GDPR appears in 107.

- PySpark stands out with a strong combination of pay and demand, offering a
  $159K median salary across 344 job postings.

- Jupyter and TensorFlow both have a median salary of $147.5K, although they
  appear in a relatively smaller number of postings.

- Some skills further down the salary ranking have much stronger demand.
  Spark appears in 787 postings, Snowflake in 752, PowerPoint in 871,
  and Flow in 559 postings.

- Tools such as Jira, Looker, JavaScript and BigQuery also appear frequently,
  showing that highly demanded skills are not always the absolute
  highest-paying ones.

Takeaway:

The highest-paying skill is not necessarily the most valuable skill to focus on.
Some skills such as Linux and MongoDB offer very high median salaries but have
lower demand, while skills such as PySpark, Spark and Snowflake provide a
stronger balance between salary and the number of available job opportunities.

┌───────────────┬───────────────┬──────────────┐
│    skills     │ median_salary │ demand_count │
│    varchar    │    double     │    int64     │
├───────────────┼───────────────┼──────────────┤
│ linux         │      165000.0 │          112 │
│ mongodb       │      163782.0 │          224 │
│ gdpr          │      163782.0 │          107 │
│ pyspark       │      159000.0 │          344 │
│ jupyter       │      147500.0 │          112 │
│ tensorflow    │      147500.0 │          126 │
│ html          │      137500.0 │          140 │
│ c             │      125000.0 │          109 │
│ scala         │      121491.0 │          275 │
│ visio         │      119250.0 │          154 │
│ confluence    │      118658.0 │          120 │
│ microstrategy │      118500.0 │          113 │
│ jira          │      114620.0 │          480 │
│ go            │      111175.0 │          360 │
│ spark         │      111175.0 │          787 │
│ powerpoint    │      111175.0 │          871 │
│ dax           │      111175.0 │          356 │
│ snowflake     │      110788.0 │          752 │
│ express       │      108413.0 │          125 │
│ bigquery      │      102500.0 │          391 │
│ looker        │       98500.0 │          507 │
│ github        │       95113.0 │          108 │
│ javascript    │       94950.0 │          459 │
│ outlook       │       93121.0 │          215 │
│ flow          │       90000.0 │          559 │
└───────────────┴───────────────┴──────────────┘
  25 rows                            3 columns

  */