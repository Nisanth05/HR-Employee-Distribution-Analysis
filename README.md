# HR-Employee-Distribution-Analysis
SQL+POWER BI

### Objective: 
The goal of this HR Employee Distribution Report is to analyze workforce diversity and distribution across various departments, locations, and demographics using SQL and Power BI.
The key focus areas include gender, race, and location distribution, as well as employee tenure.

#### Key Data Cleaning Steps:

Birthdate Formatting:

The birthdate field, originally in various formats (MM/DD/YYYY or MM-DD-YYYY), is converted into a uniform YYYY-MM-DD format.
This is achieved using STR_TO_DATE and DATE_FORMAT functions to standardize the data.

Hire Date Formatting:

Similar to the birthdate, the hire_date field is cleaned and standardized to the YYYY-MM-DD format.

Termdate Formatting:

The termdate field, which records when an employee leaves the company, is cleaned by converting timestamps to the date format YYYY-MM-DD.
If the termdate is empty or null, it is set to 0000-00-00 to avoid errors.



This cleaning using SQL ensures consistent data formats, making the analysis smoother and more accurate when visualized in Power BI.


### Findings

Employee Distribution by Department and Gender:

Highest number of employees are in Accounting (around 2.5K), followed by Engineering (over 2K).
Gender distribution across departments shows a balanced representation in certain areas such as Accounting and Sales, but Engineering is predominantly male.
Average Rate of Employment:

The average tenure of employees is 8 years, suggesting relatively stable employment within the company.

Employees by Location:

Most employees (75%) are based at the headquarters, while 25% work remotely.
Ohio has the highest concentration of employees (80.91%), with smaller percentages distributed across states like Pennsylvania, Illinois, and Michigan.

Employees by Race:

The majority of employees are White (around 5K).
Other represented racial groups include Two or More Races, Black or African American, and Asian, each ranging between 1.5K to 2.5K employees.
Gender Representation:

The total workforce consists of 8.9K males, 8.1K females, and a small percentage (0.5K) of non-conforming individuals.

### Recommendations:

Promote Gender Diversity in Technical Departments:

Since Engineering and Accounting are male-dominated, HR initiatives should focus on encouraging more female and non-conforming individuals to join these departments through targeted recruitment efforts.

Increase Remote Work Opportunities:

With only 25% of employees working remotely, there may be opportunities to expand remote work policies, particularly for underrepresented states.
Diversity Hiring:

Increase efforts to hire individuals from racial minorities such as Hispanic, Black, and Asian communities, particularly in leadership and high-impact roles.

Employee Retention Programs:

Given the 8-year average tenure, retention programs could be enhanced by offering professional development, especially for employees with more than five years of service.
This analysis offers valuable insights for HR to ensure diversity, equitable gender representation, and improved workplace inclusion across various departments and locations. 


Focus on Age Diversity:

Younger employees (18-24) and older employees (55-60) are underrepresented. Offering entry-level programs, internships, and mentorships for younger employees and flexible working conditions for older employees could help create a more balanced workforce.​​




![HR dashboard](https://github.com/user-attachments/assets/5aad5b93-454c-400f-817c-0d1245bcb3d8)






