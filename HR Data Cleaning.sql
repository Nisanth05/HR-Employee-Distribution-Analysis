CREATE DATABASE Projects;
USE Projects;
SELECT * FROM hr;

# Data cleaning

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;

SELECT birthdate FROM hr;
SET sql_safe_updates=0;

UPDATE hr
SET birthdate = CASE
    WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
	WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
	ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE
    WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
	WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
	ELSE NULL
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

DESCRIBE hr;

UPDATE hr
SET termdate = IF(termdate IS NOT NULL AND termdate != '',date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC')),'0000-00-00')
WHERE true;
SELECT termdate FROM hr;

SET sql_mode='ALLOW_INVALID_DATES';

ALTER TABLE hr
MODIFY COLUMN termdate DATE;

# adding age column

ALTER TABLE hr ADD COLUMN age INT;

UPDATE hr
SET age=timestampdiff(YEAR,birthdate,CURDATE());
SELECT birthdate,age FROM hr;

SELECT COUNT(*) FROM hr WHERE age<18;

# QUESTIONS

# 1) What is the gender breakdown of the employees in the company?

SELECT gender,COUNT(*) AS Count FROM hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY gender;

# 2) What is the race/ethnicity  breakdown of the employees in the company?

SELECT race,COUNT(*) AS Count FROM hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY race
ORDER BY Count DESC;

# 3) What is the age distribution of the employees in the company?

SELECT min(age) AS youngest,max(age) AS older FROM hr
WHERE age>18 and termdate = '0000-00-00';

SELECT
  CASE
    WHEN age >= 18 AND age<= 24 THEN '18-24'
	WHEN age >= 25 AND age<= 34 THEN '25-34'
	WHEN age >= 35 AND age<= 44 THEN '35-44'
	WHEN age >= 45 AND age<= 54 THEN '45-54'
    WHEN age >= 55 AND age<= 60 THEN '55-60'
    ELSE '60+'
    END AS age_group,
    count(*) AS Count
FROM hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY age_group
ORDER BY age_group;

# age group and gender

SELECT
  CASE
    WHEN age >= 18 AND age<= 30 THEN '18-30'
	WHEN age >= 31 AND age<= 40 THEN '31-40'
	WHEN age >= 41 AND age<= 50 THEN '41-50'
	WHEN age >= 51 AND age<= 60 THEN '51-60'
    ELSE '60+'
    END AS age_group,gender,
    COUNT(*) AS Count
FROM hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY age_group,gender
ORDER BY age_group,gender;

#4)howmany employees work at the headquarters vs remote locations

SELECT location,COUNT(*) AS count FROM hr
WHERE age>18 and termdate = '0000-00-00'
GROUP BY location;

# 5) what is the average length of employment for employees who havebeen terminated?

SELECT ROUND(AVG(datediff(termdate,hire_date))/365) AS avg_length_of_employment_in_years FROM hr
WHERE termdate<= curdate() AND age>18 and termdate<>'0000-00-00';

# 6) How does the gender distribution vary across departments and jobtitles?

SELECT department,gender,count(*) AS Count FROM hr
WHERE age>18 and termdate='0000-00-00'
GROUP BY department,gender
ORDER BY department;

# 7) What is the distribution of jobtitles across the company?
SELECT jobtitle,count(*) AS count
FROM hr
WHERE age>18 and termdate='0000-00-00'
GROUP BY jobtitle
ORDER BY jobtitle DESC;

#8) what is the distribution of employees across locations by city and state?

SELECT location_state,count(*) AS count
FROM hr
WHERE age>18 and termdate='0000-00-00'
GROUP BY location_state;

#9) what is the tenure distribution for each department?

SELECT department,ROUND(AVG(datediff(termdate,hire_date)/365),0) AS avg_tenure
FROM hr
WHERE termdate <= curdate() AND termdate!=0 AND age>18
GROUP BY department;


     








