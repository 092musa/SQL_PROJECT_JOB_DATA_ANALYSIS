/*
Answer: What are the top paying skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

select 
sd.skills,
ROUND(AVG(jpf.salary_year_avg),0) AS average_salary
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    sd.skills
ORDER BY 
average_salary DESC
LIMIT 15

/*
Specialized Technical Skills Drive Higher Salaries: The highest-paying skills
are concentrated in advanced technologies such as Solidity, DataRobot, MXNet, PyTorch,
Kafka, and Terraform, showing that specialized engineering,machine 
learning, and infrastructure knowledge is strongly associated with higher compensation.

Machine Learning & Data Engineering Skills Stand Out: Skills tied to machine learning 
frameworks and large-scale data systems consistently appear among the highest salary 
averages, suggesting that analysts who move beyond basic reporting into predictive 
modeling and data engineering can access more lucrative roles.

Cloud & DevOps Knowledge Adds Salary Value: Tools such as Terraform, GitLab, VMware,
Puppet, and Kafka highlight the growing overlap between analytics and modern data 
infrastructure, indicating that analysts with deployment, cloud, and pipeline-related
 skills may have stronger earning potential.
[
  {
    "skills": "svn",
    "average_salary": "400000"
  },
  {
    "skills": "solidity",
    "average_salary": "179000"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "golang",
    "average_salary": "155000"
  },
  {
    "skills": "mxnet",
    "average_salary": "149000"
  },
  {
    "skills": "dplyr",
    "average_salary": "147633"
  },
  {
    "skills": "vmware",
    "average_salary": "147500"
  },
  {
    "skills": "terraform",
    "average_salary": "146734"
  },
  {
    "skills": "twilio",
    "average_salary": "138500"
  },
  {
    "skills": "gitlab",
    "average_salary": "134126"
  },
  {
    "skills": "kafka",
    "average_salary": "129999"
  },
  {
    "skills": "puppet",
    "average_salary": "129820"
  },
  {
    "skills": "keras",
    "average_salary": "127013"
  },
  {
    "skills": "pytorch",
    "average_salary": "125226"
  }
]

*/