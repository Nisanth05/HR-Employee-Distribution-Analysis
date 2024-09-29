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



This cleaning ensures consistent data formats, making the analysis smoother and more accurate when visualized in Power BI.


