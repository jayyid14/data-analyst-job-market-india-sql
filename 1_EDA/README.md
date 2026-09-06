# Exploratory Data Analysis with SQL: Job Market Analysis
 
![Project 1 Overview](../Images/1_1_Project1_EDA.png)

A SQL project analysing the Data Analyst job market in India using real-world job posting data. It demonstrates my ability to **write structured analytical SQL, work across related tables, and turn business questions into clear data-driven insights**
 

##  📌 Executive Summary

- ✅ **Project scope:** Built **3 analytical SQL queries** to study the Data Analyst job market in India

- ✅ **Data modeling:** Used **multi-table joins** across job postings, skills, and bridge tables to connect jobs with their required skills

- ✅ **Analytics:** Applied **aggregations, filtering, grouping, sorting, median salary analysis, and logarithmic scoring** to compare skills by demand, salary, and overall value

- ✅ **Outcomes:** Identified the most in-demand, highest-paying, and most optimal skills for Data Analyst roles in India

If you only have a minute, review these:

1. [`01_top_demanded_skills.sql`](/1_EDA/01_top_demanded_skills.sql) - Demand analysis with multi-table joins

2. [`02_top_paying_skills.sql`](/1_EDA/02_top_paying_skills.sql) - Salary analysis with aggregations

3. [`03_optimal_skills.sql`](/1_EDA/03_optimal_skills.sql) - Combined demand/salary optimisation query

## 🎯 Problem and Context

The goal of this project is to understand which skills are most valuable for Data Analyst roles in India

The analysis focuses on three questions:

1. **Most in-demand:** *Which skills are most in demand?*
2. **Highest paid:** *Which skills are associated with the highest median salaries?*
3. **Best trade-off:** *Which skills provide the best balance between salary and demand?*


This project analyses a **data warehouse** built using a star-schema style design. The warehouse structure consists of:

![Data Warehouse](/Images/1_2_Data_Warehouse.png)

- **Fact Table:** `job_postings_fact` - Central table containing job posting details such as job titles, locations, salaries, dates, etc

- **Dimension Tables:**
   - `company_dim` - Company information linked to the job postings
   - `skills_dim` -  Skills catalog with skill names and types
- **Bridge Table:** `skills_jobs_dim` - Resolves the many-to-many relationship between job postings and skills

By querying across these interonnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data analysts jobs in India.


## 🛠️ Tech Stack

- **Query Engine:** DuckDB for fast OLAP-style analytical queries
- **Language:** SQL for querying, filtering, joining, aggregating, and analysing the dataset
- **Data Model:** Star schema with fact + dimension + bridge tables
- **Development:** VS Code for SQL editing + Terminal for DuckDB CLI
- **Version Control:** Git/Github for versioned SQL scripts

## 📊 Analysis Overview

### Query Structure

1. **[Top Demanded Skills](/1_EDA/01_top_demanded_skills.sql)** - Identifies the 10 most in-demand skills for remote data engineer positions
2. **[Top Paying Skills](/1_EDA/02_top_paying_skills.sql)** - Analyses the 25 highest-paying skills with salary and demand metrics
3. **[Optimal Skills](./03_optimal_skills.sql)** - Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn


### Key Insights

- **SQL leads overall:** It is the most in-demand skill and also ranks highest in the optimal-skill analysis, making it the strongest all-round skill in the dataset

- **Python and Excel remain highly valuable:** Both appear among the most demanded skills and also rank near the top when salary and demand are considered together

- **BI tools show strong demand:** Tableau and Power BI appear prominently in the demand analysis, reinforcing the importance of visualization and business intelligence skills for Data Analyst roles

- **Higher pay does not always mean higher demand:** Skills such as Spark and PowerPoint show relatively high median salaries despite appearing in fewer salary-listed postings

- **The best skills balance salary and demand:** The optimal-score analysis shows that widely demanded skills such as SQL, Python, and Excel can outperform more specialized high-paying skills because they provide a stronger overall balance

## SQL Skills Demonstrated

### Query Design and Optimisation

- **Complex Joins:** Connected `job_postings_fact`, `skills_job_dim`, and `skills_dim` with `INNER JOIN` to link job postings to their associated skills
- **Aggregations:** Applied `COUNT()` and `MEDIAN()` to measure skill demand and salary distributions
- **Filtering:** Combined multiple `WHERE` conditions such as `job_title_short`, `job_country`, and `salary_year_avg IS NOT NULL`
- **Sorting and Limiting:** Used `ORDER BY` with `DESC` and `LIMIT` for top-N analysis

### Data Analysis Techniques

- **Grouping:** Organised records by skill with `GROUP BY` to compare demand and salary metrics
- **Mathematical Functions:** Applied `LN()` to reduce the overwhelming influence of demand and `ROUND()` to keep calculated values readable
- **Aggregate Filtering:** Used `HAVING` to remove skills with insufficient observations and improve the reliability of salary-based comparisons
- **NULL Handling:** Excluded missing salary values with `salary_year_avg IS NOT NULL` where complete salary data was required
- **Derived Metrics:** Built an `optimal_score` combining median salary with logarithmically adjusted demand to compare pay and opportunity together