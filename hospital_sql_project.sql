CREATE TABLE hospital_data(
	Hospital_Name VARCHAR(100),
	Location VARCHAR(100),
	Department VARCHAR(100),
	Doctors_Count INT,
	Patients_Count INT,
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM hospital_data;

-- 1) Write an SQL query to find the total number of patients across all hospitals.
-- ANSWER
SELECT SUM(Patients_Count) AS TOTAL_PATIENTS 
FROM hospital_data;

-- 2) Retrieve the average count of doctors available in each hospital.
-- ANSWER
SELECT Hospital_Name, COUNT(Doctors_Count) AS AVERAGE_COUNT
FROM hospital_data
GROUP BY Hospital_Name;

-- 3) Find the top 3 hospital departments that have the highest number of patients.
-- ANSWER
SELECT Department, SUM(Patients_Count) AS NUMBER_OF_PATIENTS
FROM hospital_data
GROUP BY Department
ORDER BY NUMBER_OF_PATIENTS DESC LIMIT 3;

-- 4) Identify the hospital that recorded the highest medical expenses.
-- ANSWER
SELECT DISTINCT Hospital_Name , Medical_Expenses 
FROM hospital_data
ORDER BY Medical_Expenses DESC LIMIT 1;

-- 5) Calculate the average medical expenses per day for each hospital.
-- ANSWER
SELECT Hospital_Name, 
AVG(Medical_Expenses/NULLIF((discharge_date-admission_date),0)) AS AVG_DAILY_EXPENSE
FROM hospital_data
GROUP BY Hospital_Name;

-- 6) Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
-- ANSWER
SELECT Hospital_Name, Department, admission_date, discharge_date, (discharge_date-admission_date) AS STAY_DAYS
FROM hospital_data
ORDER BY STAY_DAYS DESC LIMIT 1;

-- 7) Count the total number of patients treated in each city.
-- ANSWER
SELECT location, SUM(patients_count) AS PATIENTS_TREATED
from hospital_data
GROUP BY location;

-- 8) Calculate the average number of days patients spend in each department.
-- ANSWER
SELECT department, AVG(discharge_date-admission_date) AS AVG_DAYS
FROM hospital_data
GROUP BY department;

-- 9) Find the department with the least number of patients.
-- ANSWER
SELECT DISTINCT department, patients_count AS NUMBER_OF_PATIENTS
FROM hospital_data
ORDER BY NUMBER_OF_PATIENTS ASC LIMIT 1;

-- 10) Group the data by month and calculate the total medical expenses for each month.
-- ANSWER
SELECT EXTRACT(MONTH FROM admission_date) AS Month, SUM(Medical_Expenses) AS TOTAL_EXPENSE
FROM hospital_data
GROUP BY Month
ORDER BY Month;