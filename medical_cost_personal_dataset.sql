USE medical_cost_personal_dataset;

SELECT * FROM medical_cost;

ALTER TABLE medical_cost
MODIFY COLUMN charges DECIMAL(10,2);

-- Total Number of Records in the Dataset 
SELECT COUNT(*) AS total_records 
FROM medical_cost;

-- The average medical cost 
SELECT ROUND(AVG(charges)) AS avg_charges 
FROM medical_cost;

-- Range of Medical Charges (Min & Max) 
SELECT MIN(charges) AS min_charges, MAX(charges) AS max_charges 
FROM medical_cost;

-- Number of Smokers vs Non-Smokers
SELECT smoker, COUNT(*) AS count 
FROM medical_cost 
GROUP BY smoker;

-- Average Charges by Smoking Status 
SELECT smoker, ROUND(AVG(charges)) AS average_charges
FROM medical_cost
GROUP BY smoker;

-- Highest average charges by region 
SELECT region, ROUND(AVG(charges)) AS average_charges
FROM medical_cost
GROUP BY region
ORDER BY average_charges DESC;

--  Top 5 Most Expensive Medical Charges
SELECT *
FROM medical_cost
ORDER BY charges DESC
LIMIT 5;

-- Average Medical Charges by Number of Children 
SELECT children, ROUND(AVG(charges)) AS average_charges
FROM medical_cost
GROUP BY children
ORDER BY children;

--  Average BMI by Gender
SELECT sex, ROUND(AVG(bmi)) AS average_bmi
FROM medical_cost
GROUP BY sex;  

-- Average Medical Charges by BMI Category 
SELECT
  CASE
    WHEN bmi < 18.5 THEN 'Underweight'
    WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
  END AS bmi_category,
  ROUND(AVG(charges)) AS average_cost
FROM medical_cost
GROUP BY bmi_category;

