SELECT * FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;

## Count total patients
SELECT COUNT(*) AS Total_Patients
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;

## Count patients by gender
SELECT Gender, COUNT(*) AS Count
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
GROUP BY Gender;

## Average age of patients
SELECT AVG(Age) AS Avg_Age
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;

## Patients with high Bilirubin (>2)
SELECT *
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
WHERE Bilirubin > 2;

## Top 5 patients with highest Bilirubin
SELECT *
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
ORDER BY Bilirubin DESC
LIMIT 5;

## Patients older than 50
SELECT *
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
WHERE Age > 50;

## Count missing alcohol records
SELECT COUNT(*) AS Missing_Alcohol
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
WHERE Alcohol_Consumption IS NULL;

## Distinct disease Fibrosis_Stage
SELECT DISTINCT Fibrosis_Stage
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;

## Rank patients by Bilirubin
SELECT *,
RANK() OVER (ORDER BY Bilirubin DESC) AS rank_bilirubin
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;

## Running average of Bilirubin
SELECT Age, Bilirubin,
AVG(Bilirubin) OVER (ORDER BY Age) AS Running_Avg
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;

## Highest Bilirubin per Fibrosis_Stage
SELECT Fibrosis_Stage, MAX(Bilirubin) AS max_bilirubin
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
GROUP BY Fibrosis_Stage;

## Patients above average Bilirubin
SELECT *
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
WHERE Bilirubin > (SELECT AVG(Bilirubin) FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`);

## Create Comorbidity Score
SELECT *,
(CASE WHEN Diabetes = 1 THEN 1 ELSE 0 END +
 CASE WHEN Hypertension = 1 THEN 1 ELSE 0 END) AS comorbidity_score
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;

## Average MELD score by Gender
SELECT Gender, AVG(MELD_Score) AS Avg_Meld
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
GROUP BY Gender;

## Patients with both Diabetes & Hypertension
SELECT *
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
WHERE Diabetes = 1 AND Hypertension = 1;

## Find duplicate records (if any)
SELECT Age, Gender, COUNT(*)
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
GROUP BY Age, Gender
HAVING COUNT(*) > 1;

## Identify outliers in Bilirubin (simple method)
SELECT *
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
WHERE Bilirubin > (
    SELECT AVG(Bilirubin) + 2*STDDEV(Bilirubin)
    FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
);

## Bucket patients by age group
SELECT 
CASE 
    WHEN Age < 30 THEN 'Young'
    WHEN Age BETWEEN 30 AND 50 THEN 'Middle'
    ELSE 'Old'
END AS Age_Group,
COUNT(*)
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
GROUP BY age_group;

## Find patients close to average MELD (±2)
SELECT *
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
WHERE MELD_Score BETWEEN 
(SELECT AVG(MELD_Score)-2 FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`)
AND 
(SELECT AVG(MELD_Score)+2 FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`);

## Detect imbalance in dataset
SELECT Fibrosis_Stage, COUNT(*) * 100.0 / SUM(COUNT(*)) OVER() AS Percentage
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`
GROUP BY Fibrosis_Stage;

## Feature importance proxy (variance)
SELECT 
VARIANCE(Bilirubin) AS Var_Bilirubin,
VARIANCE(Albumin) AS Var_Albumin
FROM liver_cirrhosis_prediction.`liver cirrhosis prediction`;
