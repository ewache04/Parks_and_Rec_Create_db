# **Parks and Recreation Database Setup**  

## **Overview**  
This section contains SQL scripts for setting up the **Parks and Recreation** database, including creating tables and inserting data related to employee demographics, salaries, and departments.  

## **Project Structure**  

```
database/
│── create_database.sql
├── create_tables/
│   ├── create_employee_demographics.sql
│   ├── create_employee_salary.sql
│   ├── create_parks_departments.sql
├── insert_data/
│   ├── insert_employee_demographics.sql
│   ├── insert_employee_salary.sql
│   ├── insert_parks_departments.sql
```

## **Setup Instructions**  

### **1️⃣ Create the Database**  
Run the following command to create the **Parks and Recreation** database:  
```sql
source database/create_database.sql;
```

### **2️⃣ Create Tables**  
Execute the scripts below to create the required tables:  

- **Employee Demographics Table**  
  ```sql
  source database/create_tables/create_employee_demographics.sql;
  ```

- **Employee Salary Table**  
  ```sql
  source database/create_tables/create_employee_salary.sql;
  ```

- **Parks Departments Table**  
  ```sql
  source database/create_tables/create_parks_departments.sql;
  ```

### **3️⃣ Insert Data**  
After creating the tables, populate them by running these scripts:  

- **Insert Employee Demographics Data**  
  ```sql
  source database/insert_data/insert_employee_demographics.sql;
  ```

- **Insert Employee Salary Data**  
  ```sql
  source database/insert_data/insert_employee_salary.sql;
  ```

- **Insert Parks Departments Data**  
  ```sql
  source database/insert_data/insert_parks_departments.sql;
  ```

## **Notes**  
✅ Execute the scripts in the specified order to maintain data integrity.  
✅ Ensure **MySQL** is installed and properly configured before running the scripts.  
✅ You can use **MySQL Workbench** or the **command line** to execute the scripts.  
