# 🩺 Liver Cirrhosis Disease Prediction
## 📌 Project Overview
**This project focuses on predicting the stage of Liver Cirrhosis (No Cirrhosis, Compensated, or Decompensated) using clinical and lifestyle data. By utilizing machine learning, the goal is to provide a reliable tool for early diagnosis and disease management based on critical medical markers.**

### 📊 Analysis Pipeline
**1.** The project follows a rigorous Data Science lifecycle:

**2.** Data Cleaning & Imputation: Handled missing values (24% in Alcohol Consumption) and addressed outliers in clinical markers.

**3.** EDA & Visualization: Analyzed class distributions and visualized correlations between features like Bilirubin, MELD Score, and Albumin.

**4.** Feature Engineering: Developed a Comorbidity_Score and applied standard scaling to numerical inputs.

**5.** Model Development: Evaluated multiple classifiers including Logistic Regression, Gradient Boosting, and Random Forest.

### 🏆 Key Results
* Best Model: Random Forest Classifier.

* Accuracy: Achieved 100% accuracy on the test set.

* Reliability: Validated via 5-Fold Cross-Validation with a mean accuracy of 0.99 (±0.02), ensuring the model generalizes well to unseen data.

* Clinical Drivers: The top predictors identified were MELD_Score, Bilirubin, and Platelet_Count.

### 🛠️ Tech Stack
* Language: Python

* Libraries: Pandas, NumPy, Scikit-Learn, Matplotlib, Seaborn

* Environment: Jupyter Notebook / Google Colab

### 📂 Dataset
The dataset contains 100 patient records with 37 features, including demographics (Age, Gender, BMI), lifestyle factors, and detailed clinical laboratory results.

### 🚀 How to Run
**1.** Clone the repository.

**2.** Install dependencies: pip install -r requirements.txt.

**3.** Open Liver_Cirrhosis_Prediction.ipynb to view the full analysis and model training. Install dependencies: pip install -r requirements.txt.
Open Liver_Cirrhosis_Prediction.ipynb to view the full analysis and model training.
