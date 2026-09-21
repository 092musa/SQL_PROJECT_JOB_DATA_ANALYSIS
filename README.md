# 📊 SQL Data Job Market Analysis

## Introduction

This project analyzes **2023 job-posting data** using PostgreSQL to explore salary trends, skill demand, and the technologies associated with higher-paying data roles.

The project focuses primarily on **Data Analyst positions** and uses SQL to answer practical career questions such as:

1. What are the highest-paying remote Data Analyst jobs?
2. Which skills are required for the highest-paying Data Analyst roles?
3. What skills are most in demand for Data Scientist positions?
4. Which skills are associated with the highest Data Analyst salaries?
5. Which skills provide the strongest combination of **high demand and high pay**?

The goal was to move beyond simply querying data and use SQL to generate insights that could help identify valuable skills and career opportunities in the data job market.

---

## Background

The dataset contains job postings from 2023 along with information about:

- Job titles
- Companies
- Locations
- Salaries
- Skills associated with each job posting

The database is organized across several relational tables:

- `job_postings_fact`
- `company_dim`
- `skills_dim`
- `skills_job_dim`

These tables were joined together throughout the project to connect job postings with companies, salaries, and required technical skills.

---

## 🛠️ Tools I Used

- **PostgreSQL** — database management and querying
- **SQL** — data extraction and analysis
- **pgAdmin** — PostgreSQL database administration
- **Visual Studio Code** — writing and executing SQL
- **Git & GitHub** — version control and project documentation

### SQL Concepts Used

- `SELECT`
- `WHERE`
- `INNER JOIN`
- `LEFT JOIN`
- `GROUP BY`
- `COUNT()`
- `AVG()`
- `ROUND()`
- `ORDER BY`
- `LIMIT`
- Common Table Expressions using `WITH`

---

# 🔍 The Analysis

## 1. What are the highest-paying remote Data Analyst jobs?

The first query identifies the highest-paying **remote Data Analyst positions** with reported yearly salaries.

The analysis filters for:

- `Data Analyst` roles
- Remote jobs
- Positions with non-null salary information
- Highest salaries first

**SQL Query:**  
[`top_paying_jobs.sql`](Project_SQL/top_paying_jobs.sql)

### Key Insights

- The highest-paying roles extend well beyond entry-level reporting and include **principal, director, and specialized analytical positions**.
- Among the skill-linked roles analyzed, yearly salaries ranged from approximately **$184K to $256K**.
- The highest salary observed was approximately **$255,830** for an Associate Director - Data Insights position at AT&T.

Highest Paying Remote Data Analyst Roles![alt text](<assets/Image Sep 21, 2026, 05_38_21 PM.png>)

---

## 2. What skills are required for the highest-paying Data Analyst jobs?

The next query takes the highest-paying Data Analyst positions and joins them with the skills tables to determine which technologies appear most frequently.

**SQL Query:**  
[`top_required_skills_highpay_analyst_jobs.sql`](Project_SQL/top_required_skills_highpay_analyst_jobs.sql)

### Most Common Skills

| Skill | Roles | Coverage |
|---|---:|---:|
| SQL | 8 | 100% |
| Python | 7 | 87.5% |
| Tableau | 6 | 75% |
| R | 4 | 50% |
| Pandas | 3 | 37.5% |
| Excel | 3 | 37.5% |
| Snowflake | 3 | 37.5% |
| Azure | 2 | 25% |
| AWS | 2 | 25% |

### Key Insights

- **SQL is the strongest common skill**, appearing in every top-paying role with available skill mappings.
- **Python and Tableau are also highly prevalent**, appearing in approximately 88% and 75% of these positions.
- High-paying analyst positions frequently combine traditional analytics with **programming, visualization, cloud platforms, and modern data infrastructure**.

Most Common Skills in Top-Paying Data Analyst Roles![alt text](<assets/Image Sep 21, 2026, 05_35_44 PM (1).png>)

---

## 3. What are the most in demand skills in Data Science?

This query identifies the **top 5 most in-demand skills for Data Scientist roles** by counting how often each skill appears across job postings.

**SQL Query:**  
[`top_demad_skills_datascience.sql`](Project_SQL/top_demad_skills_datascience.sql)

The query uses:

- `INNER JOIN` to connect job postings with their associated skills
- `COUNT()` to measure how frequently each skill appears
- `GROUP BY` to aggregate results by skill
- `ORDER BY` to rank skills from most requested to least requested
- `LIMIT` to return the top five skills


Top 5 In-Demand Data Science Skills
### Key Findings
![alt text](<assets/Image Sep 21, 2026, 05_56_58 PM.png>)
The results show that **Python** is the most in-demand skill in Data Science by a wide margin, appearing in **114,016** job postings. It is followed by **SQL** with **79,174** postings and **R** with **59,754**, confirming that programming and data handling skills are the foundation of Data Science roles.

Traditional analytics tools still remain relevant. **SAS** appears in **29,642** postings, while **Tableau** appears in **29,513**, showing that employers still value statistical analysis platforms and data visualization tools alongside modern programming languages.

### Why This Matters

This analysis highlights which skills are most consistently requested by employers in the Data Science market. While salary shows earning potential, demand shows how often a skill is needed in real job opportunities. Together, these insights help identify skills that are not only valuable, but also widely applicable for breaking into or advancing in Data Science.


## 4. Which Data Analyst skills are associated with the highest salaries?

The fourth query calculates the **average yearly salary associated with each skill** across Data Analyst job postings with reported salary information.

**SQL Query:**  
[`top_skill_with_highpay.sql`](Project_SQL/top_skill_with_highpay.sql)

### Highest Average Salaries

| Skill | Average Salary |
|---|---:|
| SVN | $400,000 |
| Solidity | $179,000 |
| Couchbase | $160,515 |
| DataRobot | $155,486 |
| Golang | $155,000 |
| MXNet | $149,000 |
| dplyr | $147,633 |
| VMware | $147,500 |
| Terraform | $146,734 |
| Twilio | $138,500 |
| GitLab | $134,126 |
| Kafka | $129,999 |
| Puppet | $129,820 |
| Keras | $127,013 |
| PyTorch | $125,226 |

### Key Insights

- **Specialized technical skills are associated with higher salaries**, especially technologies related to machine learning, engineering, infrastructure, and software development.
- Skills such as **DataRobot, MXNet, Kafka, Keras, and PyTorch** show the potential salary value of expanding beyond traditional reporting and visualization.
- Cloud, deployment, and infrastructure technologies such as **Terraform, VMware, GitLab, and Puppet** demonstrate the growing overlap between analytics and engineering.

> **Important:** SVN's $400K average is a major outlier. Average salary alone does not show how frequently a skill appears, so rare skills can be heavily influenced by one or a small number of unusually high-paying positions.

---

## 5. What are the most optimal skills to learn?

The final analysis combines **job demand and average salary** to identify skills that offer both strong employment opportunities and competitive compensation.

**SQL Query:**  
[`optimal_skills_highdemand_highpay.sql`](Project_SQL/optimal_skills_highdemand_highpay.sql)

Two Common Table Expressions are used:

- `skills_demand` calculates how many job postings request each skill.
- `average_salary` calculates the average salary associated with each skill.

The two results are then joined together using `skill_id`.

To avoid giving too much importance to extremely rare technologies, the final query only includes skills where:

```sql
demand_count > 15
```

### Selected Results

| Skill | Demand Count | Average Salary |
|---|---:|---:|
| Kafka | 40 | $129,999 |
| PyTorch | 20 | $125,226 |
| TensorFlow | 24 | $120,647 |
| Airflow | 71 | $116,387 |
| Scala | 59 | $115,480 |
| GCP | 78 | $113,065 |
| Spark | 187 | $113,002 |
| Databricks | 102 | $112,881 |
| Snowflake | 241 | $111,578 |
| Hadoop | 140 | $110,888 |
| Pandas | 90 | $110,767 |

### Key Insights

- **Snowflake and Spark provide the strongest market demand**, appearing in 241 and 187 postings respectively while maintaining average salaries above $111K.
- **Kafka offers the strongest salary premium among the filtered high-demand skills**, averaging approximately $130K, although its demand is lower at 40 postings.
- **Databricks, Airflow, GCP, Spark, and Snowflake show a strong balance between demand and compensation**, highlighting the value of modern cloud and data-engineering technologies.

Optimal Skills - Demand vs Average Salary![alt text](<assets/Image Sep 21, 2026, 05_39_22 PM.png>)

### Why This Analysis Is Important

Looking at salary alone can be misleading.

A skill with a very high average salary may appear in very few job postings, while an extremely common skill may not necessarily offer the highest compensation.

Combining the two measures gives a more practical way to evaluate career value:

> **High Demand + High Salary = Stronger Skill Opportunity**

The scatter plot helps visualize this trade-off:

- Moving **right** means greater job demand.
- Moving **up** means higher average salary.
- Skills positioned toward the **upper-right area** provide the strongest combination of both.

---

# 🧠 What I Learned

This project helped strengthen my ability to work with relational databases and perform analytical SQL beyond basic queries.

### Technical Skills Developed

- Joining multiple tables using `INNER JOIN` and `LEFT JOIN`
- Working with relational keys such as `job_id`, `company_id`, and `skill_id`
- Aggregating data using `COUNT()` and `AVG()`
- Grouping results with `GROUP BY`
- Filtering missing salary values using `IS NOT NULL`
- Ranking results using `ORDER BY`
- Restricting results using `LIMIT`
- Building multi-step queries using **Common Table Expressions**
- Combining separate analyses through joins
- Comparing multiple metrics such as demand and salary

### Analytical Lessons

I also learned that query results need context.

For example:

- A high salary does not automatically mean a skill is widely valuable.
- A highly demanded skill does not automatically mean it pays the most.
- Rare skills can create misleading salary averages.
- Combining multiple measures can produce much stronger conclusions than analyzing one metric alone.

---

# ✅ Conclusions

The analysis revealed several important patterns across the 2023 data job market.

### 1. SQL remains foundational

SQL appeared in **100% of the top-paying Data Analyst roles with available skill mappings**.

Python and Tableau were also extremely common, appearing in approximately **88% and 75%** of these roles.

This suggests that a strong core analytics stack continues to revolve around:

**SQL + Python + Data Visualization**

---

### 2. Higher-paying roles require broader technical depth

Many high-paying Data Analyst positions requested skills beyond traditional Excel reporting.

The results included technologies related to:

- Cloud computing
- Machine learning
- Data engineering
- Modern data warehouses
- Development and deployment

This shows that advanced analyst positions increasingly overlap with broader data and engineering responsibilities.

---

### 3. Specialized skills can increase earning potential

Machine learning and engineering-related technologies appeared prominently among the highest-paying skills.

Examples include:

- DataRobot
- PyTorch
- TensorFlow
- Kafka
- Terraform
- MXNet

However, specialized skills should be evaluated alongside market demand rather than salary alone.

---

### 4. Modern data-platform skills provide strong career value

The final analysis showed particularly strong demand for technologies such as:

- **Snowflake — 241 postings**
- **Spark — 187 postings**
- **Hadoop — 140 postings**
- **Databricks — 102 postings**
- **GCP — 78 postings**
- **Airflow — 71 postings**

These technologies combine relatively strong salaries with meaningful job demand.

---

## 🎯 Final Takeaway

The strongest career strategy is not simply learning the highest-paying technology.

The analysis suggests building a strong foundation in:

**SQL → Python → Visualization**

and then expanding into:

**Cloud Platforms → Data Warehouses → Data Engineering → Machine Learning**

This combination provides both broad job-market relevance and a path toward more specialized, higher-paying data roles.

---

## 📁 Repository Structure

```text
SQL_PROJECT_JOB_DATA_ANALYSIS/
│
├── Project_SQL/
│   ├── top_paying_jobs.sql
│   ├── top_required_skills_highpay_analyst_jobs.sql
│   ├── top_demad_skills_datascience.sql
│   ├── top_skill_with_highpay.sql
│   └── optimal_skills_highdemand_highpay.sql
│
├── assets/
│   ├── 01_highest_paying_remote_roles.png
│   ├── 02_top_skills_in_high_paying_roles.png
│   └── 03_optimal_skills_demand_vs_salary.png
│
├── csv_files/
├── sql_load/
└── README.md
```
