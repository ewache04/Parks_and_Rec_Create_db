## **Employee Salary Data Analysis Report**

### **Prepared by: Jeremiah (Data Analyst)**
### **Date: 2/25/2025**
### **Requested by: James Nathan**

---

### **1. Overview**
This report analyzes the **employee_salary** table, which includes employee ID, first name, last name, occupation, salary, and department ID. The goal is to provide actionable insights into salary distribution, department-wise expenditures, and employee compensation trends.

---

### **2. Key Insights**

#### **2.1. Salary Distribution**
- **Total Employees**: There are **30 employees** in the database.
- **Salary Range**:
  - The **lowest salary** is **$15,000** (Orin Redacted).
  - The **highest salary** is **$120,000** (Dennis Feinstein and Oscar Olsen).
  - The **average salary** is **$54,166.67**.

#### **2.2. Department-wise Salary Expenditure**
- **Total Salary Expenditure**: **$1,625,000**.
- **Department-wise Breakdown**:
  - **Parks and Recreation (dept_id = 1)**: $395,000.
  - **Public Works (dept_id = 3)**: $147,000.
  - **Healthcare (dept_id = 4)**: $55,000.
  - **Finance (dept_id = 6)**: $70,000.
  - **No Department (dept_id = NULL)**: $958,000.

#### **2.3. Employees Earning Above the Average Salary**
- There are **14 employees** earning above the average salary of **$54,166.67**. These employees include:
  - Leslie Knope ($75,000)
  - Ron Swanson ($70,000)
  - Donna Meagle ($60,000)
  - Chris Traeger ($90,000)
  - Ben Wyatt ($70,000)
  - Craig Middlebrooks ($65,000)
  - Dennis Feinstein ($120,000)
  - Jennifer Barkley ($95,000)
  - Sam Smith ($65,000)
  - Samantha Sims ($60,000)
  - Olivia Ortiz ($57,000)
  - Adam Adams ($70,000)
  - Oscar Olsen ($120,000)
  - Emily Elliott ($95,000)

#### **2.4. Employees Earning Below the Average Salary**
- There are **16 employees** earning below the average salary of **$54,166.67**. These employees include:
  - Tom Haverford ($50,000)
  - April Ludgate ($25,000)
  - Jerry Gergich ($50,000)
  - Ann Perkins ($55,000)
  - Andy Dwyer ($20,000)
  - Mark Brendanawicz ($57,000)
  - Perd Hapley ($48,000)
  - Jean-Ralphio Saperstein ($30,000)
  - Mona-Lisa Saperstein ($30,000)
  - Orin Redacted ($15,000)
  - Shauna Malwae-Tweep ($52,000)
  - Ethel Beavers ($10,000)
  - Eva Evans ($55,000)
  - Ivy Ingram ($20,000)
  - Uma Underwood ($48,000)
  - Aaron Aaronson ($90,000)

#### **2.5. Employees with No Department**
- There are **10 employees** not assigned to any department (dept_id = NULL). Their total salary expenditure is **$958,000**.

---

### **3. Detailed Findings**

#### **3.1. Employees Earning Above $70,000**
- There are **8 employees** earning above $70,000:
  - Leslie Knope ($75,000)
  - Ron Swanson ($70,000)
  - Chris Traeger ($90,000)
  - Ben Wyatt ($70,000)
  - Dennis Feinstein ($120,000)
  - Jennifer Barkley ($95,000)
  - Oscar Olsen ($120,000)
  - Emily Elliott ($95,000)

#### **3.2. Employees Earning Below $30,000**
- There are **4 employees** earning below $30,000:
  - April Ludgate ($25,000)
  - Andy Dwyer ($20,000)
  - Orin Redacted ($15,000)
  - Ethel Beavers ($10,000)

#### **3.3. Department-wise Average Salary**
- **Parks and Recreation (dept_id = 1)**: $55,000.
- **Public Works (dept_id = 3)**: $73,500.
- **Healthcare (dept_id = 4)**: $55,000.
- **Finance (dept_id = 6)**: $70,000.
- **No Department (dept_id = NULL)**: $95,800.

#### **3.4. Employees with the Same Occupation**
- Employees with the same occupation as **Leslie Knope** (Deputy Director of Parks and Recreation):
  - Leslie Knope ($75,000).

---

### **4. Recommendations**

#### **4.1. Salary Disparities**
- Address the significant salary disparities, especially for employees earning below $30,000. Consider adjusting salaries to ensure fair compensation.

#### **4.2. Department-wise Budget Allocation**
- Review the salary expenditure for departments, especially for employees not assigned to any department (dept_id = NULL). Allocate budgets more effectively to ensure equitable distribution.

#### **4.3. Employee Retention**
- Employees earning above $70,000 are likely in senior or specialized roles. Implement retention strategies to prevent turnover in these critical positions.

#### **4.4. Performance Reviews**
- Conduct performance reviews for employees earning below the average salary to identify opportunities for raises or promotions.

---

### **5. Conclusion**
The analysis provides a comprehensive overview of the salary data in the Parks and Recreation department. Key findings include significant salary disparities, high expenditure for employees not assigned to any department, and a concentration of high earners in senior roles. These insights can inform compensation strategies, budget allocation, and employee retention initiatives.

---

### **6. Next Steps**
- Conduct a deeper analysis of salary disparities by gender and occupation.
- Review department-wise budget allocations and adjust as needed.
- Implement performance review processes to address salary gaps.
