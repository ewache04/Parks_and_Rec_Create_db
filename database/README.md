# **Parks and Recreation Database Setup**  

## **Overview**  
This section contains SQL scripts for setting up the **Parks and Recreation** database, including creating tables and inserting data related to employee demographics, salaries, and departments.  

## **Project Structure**  

```
database/
│
├── create_database.sql         
├── create_tables/               
│   ├── create_parks_departments.sql
│   ├── create_employee_demographics.sql
│   ├── create_employee_salary.sql
│
├── insert_data/                
│   ├── insert_parks_departments.sql
│   ├── insert_employee_demographics.sql
│   ├── insert_employee_salary.sql
│
└── README.md             
```

---

## **Setup Instructions**  

Follow these steps to set up the **Parks and Recreation** database:  

### **1️⃣ Create the Database**  
Run the following command to create the **Parks and Recreation** database:  
```sql
source database/create_database.sql;
```

---

### **2️⃣ Create Tables**  
Execute the scripts below to create the required tables **in the correct order**:  

1. **Parks Departments Table**  
   ```sql
   source database/create_tables/create_parks_departments.sql;
   ```

2. **Employee Demographics Table**  
   ```sql
   source database/create_tables/create_employee_demographics.sql;
   ```

3. **Employee Salary Table**  
   ```sql
   source database/create_tables/create_employee_salary.sql;
   ```

---

### **3️⃣ Insert Data**  
After creating the tables, populate them by running these scripts **in the correct order**:  

1. **Insert Parks Departments Data**  
   ```sql
   source database/insert_data/insert_parks_departments.sql;
   ```

2. **Insert Employee Demographics Data**  
   ```sql
   source database/insert_data/insert_employee_demographics.sql;
   ```

3. **Insert Employee Salary Data**  
   ```sql
   source database/insert_data/insert_employee_salary.sql;
   ```

---

## **Usage Tips**  

- **Order of Execution**: Execute the scripts in the specified order to maintain data integrity.  
  1. Create the database.  
  2. Create the tables in the order: `parks_departments`, `employee_demographics`, `employee_salary`.  
  3. Insert the data in the order: `parks_departments`, `employee_demographics`, `employee_salary`.  

- **Tools**: You can use **MySQL Workbench** or the **command line** to execute the scripts.  

- **Prerequisites**:  
  ✅ Ensure **MySQL** is installed and properly configured before running the scripts.  
  ✅ Verify that you have the necessary permissions to create databases and tables.  

- **Troubleshooting**:  
  - If you encounter errors, double-check the SQL syntax and ensure the database connection is active.  
  - If data insertion fails, verify that the SQL scripts in the `insert_data` folder are correctly formatted and match the table schemas.  

---

## **Next Steps**  
Once the database is set up, you can explore the **analytical insights** and **SQL queries** located in the `sql_queries_and_analytical_insights` folder to analyze the data.