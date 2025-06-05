# 🏥 Medical Cost Personal Dataset – SQL Analysis

This project explores the **Medical Cost Personal Dataset** using SQL to uncover trends and insights related to healthcare expenses. The dataset includes patient-level information such as age, sex, BMI, number of children, smoking status, and region.

---

## 📁 Dataset Overview

- **Source:** `medical_cost_personal_dataset`
- **Table:** `medical_cost`
- **Records:** 1,300+
- **Key Fields:** `age`, `sex`, `bmi`, `children`, `smoker`, `region`, `charges`

---

## 🎯 Objectives

- Understand medical cost distribution
- Analyze the impact of lifestyle (e.g., smoking, BMI) on healthcare charges
- Explore demographic and regional variations in medical expenses

---

## 🧰 Tools Used

- **SQL** (MySQL dialect)
  - Aggregate functions: `AVG`, `MIN`, `MAX`, `COUNT`
  - Grouping and ordering with `GROUP BY`, `ORDER BY`
  - Conditional logic using `CASE`
  - Data formatting and cleaning (e.g., modifying column types)

---

## 🔍 Key Analyses

- ✅ **Total Records**: Counted all entries in the dataset  
- 💰 **Average, Min, and Max Charges**: Calculated key summary stats for `charges`  
- 🚬 **Smoker vs Non-Smoker**:
  - Count comparison
  - Average charges by smoking status (smokers pay significantly more)  
- 🌍 **Regional Insights**:
  - Compared average charges across regions
  - Identified the region with the highest average medical cost  
- 💡 **Top 5 Highest Charges**: Identified outliers with the highest medical costs  
- 👶 **Impact of Children**: Analyzed how the number of children affects average charges  
- ⚖️ **BMI Analysis**:
  - Average BMI by gender
  - Charges grouped by BMI category (Underweight, Normal, Overweight, Obese)

---

## 📊 Sample Query

```sql
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
