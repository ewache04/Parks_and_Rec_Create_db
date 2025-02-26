# **SQL Queries and Analytical Insights Guide**  

## **Overview**  
The `sql_queries_and_analytical_insights` folder contains SQL queries and analytical insights for the **Parks and Recreation** database. These queries and insights are organized by topic, focusing on **employee demographics**, **employee salaries**, and **parks departments**.  

This guide will help you navigate the folder, understand the structure, and use the provided SQL queries and insights effectively.  

---

## **Project Structure**  

```
sql_queries_and_analytical_insights/
├── employee_demography/
│   ├── sql_queries.sql
│   ├── analytical_insights.md
├── employee_salary/
│   ├── sql_queries.sql
│   ├── analytical_insights.md
└── parks_departments/
    ├── sql_queries.sql
    ├── analytical_insights.md
```

---

## **Folder Breakdown**  

### **1️⃣ Employee Demography**  
- **`sql_queries.sql`**: Contains SQL queries related to employee demographics, such as filtering, grouping, and analyzing employee data.  
- **`analytical_insights.md`**: Provides insights and explanations derived from the queries, such as trends in employee demographics or key statistics.  

### **2️⃣ Employee Salary**  
- **`sql_queries.sql`**: Contains SQL queries related to employee salaries, such as calculating averages, identifying outliers, or comparing salary ranges.  
- **`analytical_insights.md`**: Provides insights and explanations derived from the queries, such as salary distribution or department-wise salary trends.  

### **3️⃣ Parks Departments**  
- **`sql_queries.sql`**: Contains SQL queries related to parks departments, such as department performance, resource allocation, or employee distribution.  
- **`analytical_insights.md`**: Provides insights and explanations derived from the queries, such as department efficiency or key metrics.  

---

## **How to Use**  

### **1️⃣ Running SQL Queries**  
1. Open the `sql_queries.sql` file for the topic you're interested in (e.g., `employee_demography/sql_queries.sql`).  
2. Copy the queries and execute them in your MySQL environment (e.g., MySQL Workbench or command line).  
3. Review the results to analyze the data.  

### **2️⃣ Reading Analytical Insights**  
1. Open the `analytical_insights.md` file for the topic you're interested in (e.g., `employee_demography/analytical_insights.md`).  
2. Read the insights to understand the key findings and trends derived from the SQL queries.  
3. Use these insights to inform decision-making or further analysis.  

---

## **Example Queries and Insights**  

### **Employee Demography**  
- **Query**: Find the average age of employees by department.  
  ```sql
  SELECT department, AVG(age) AS average_age
  FROM employee_demographics
  GROUP BY department;
  ```  
- **Insight**: The marketing department has the youngest average age, while the finance department has the oldest.  

### **Employee Salary**  
- **Query**: Identify employees earning above the average salary.  
  ```sql
  SELECT employee_id, first_name, last_name, salary
  FROM employee_salary
  WHERE salary > (SELECT AVG(salary) FROM employee_salary);
  ```  
- **Insight**: 30% of employees earn above the average salary, with most belonging to the engineering department.  

### **Parks Departments**  
- **Query**: Count the number of employees in each department.  
  ```sql
  SELECT department, COUNT(employee_id) AS employee_count
  FROM parks_departments
  GROUP BY department;
  ```  
- **Insight**: The parks maintenance department has the highest number of employees, reflecting its operational scale.  

---

## **Best Practices**  

- **Modify Queries**: Feel free to modify the queries to suit your specific analysis needs.  
- **Combine Insights**: Use insights from multiple topics (e.g., demographics and salaries) to gain a holistic understanding of the data.  
- **Document Findings**: Add your own insights or observations to the `analytical_insights.md` files for future reference.  

---

## **Next Steps**  
- Explore the `csv_files` folder for exported  raw data used in the database.  
- Refer to the `database` folder for scripts to set up and populate the database.  
- Use the `media` folder for visual representations of the database tables.  