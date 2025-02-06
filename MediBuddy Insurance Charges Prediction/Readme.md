# MediBuddy Insurance Analysis & Prediction Model

![image](https://github.com/user-attachments/assets/16fcabc7-68cd-453d-91dc-083643f4a330)

## 📌 Project Overview
This project involves an in-depth analysis of insurance claims data to derive insights and develop a predictive machine learning model for estimating insurance charges. The dataset consists of patient demographics, BMI, smoking habits, geographic locations, and policy details.

## 🎯 Objectives
1. **Data Analysis:** Identify key factors affecting insurance claims, such as gender, BMI, smoking status, and geographic region.
2. **Machine Learning Model:** Develop a predictive model to estimate insurance charges with high accuracy.
3. **Hyperparameter Tuning:** Optimize the model for better performance.
4. **Business Insights:** Provide recommendations for insurance policy adjustments based on the analysis.

---

## 📊 Data Analysis & Insights

### 1️⃣ Does Gender Impact Insurance Policies?
- **T-Test Result:** p-value = 0.0358 → **Gender has a statistically significant effect on insurance charges.**
- **Conclusion:** The company may need to consider gender when pricing policies.

### 2️⃣ Average Amount Spent Per Policy Cover
- **Mean Insurance Charge:** ₹XYZ (Derived from dataset analysis)
- **Conclusion:** Helps in setting base policy pricing.

### 3️⃣ Should Policies Vary by Geographic Location?
- **ANOVA Test Result:** Significant variation in insurance charges across regions.
- **Conclusion:** Different pricing models should be considered based on geographic risk factors.

### 4️⃣ Impact of Dependents on Claims
- **Findings:** More dependents correlate with higher claims.
- **Conclusion:** Premiums should account for family size.

### 5️⃣ Does BMI Influence Insurance Charges?
- **Correlation Analysis:** Higher BMI is associated with increased charges.
- **Conclusion:** BMI-based discounts or surcharges may be necessary.

### 6️⃣ Effect of Smoking on Insurance Charges
- **T-Test Result:** Smokers have significantly higher charges.
- **Conclusion:** Higher premiums for smokers are justified.

### 7️⃣ Does Age Affect Insurance Claims?
- **Regression Analysis:** Older individuals tend to have higher claims.
- **Conclusion:** Age-based pricing tiers may be needed.

### 8️⃣ Should Discounts Be Offered Based on Health (BMI)?
- **Analysis:** Healthier individuals incur lower costs.
- **Conclusion:** Incentivizing healthy lifestyles with discounts is viable.

---

## 🤖 Machine Learning Model

### 📂 Dataset Used
- **Features:** Age, BMI, Number of Dependents, Gender, Smoker, Region
- **Target Variable:** Insurance Charges

### 🚀 Model Pipeline
1. **Preprocessing:**
   - Standardization of numerical features.
   - One-hot encoding for categorical features.
2. **Model Selection:**
   - **Random Forest Regressor** (Best-performing model)
3. **Hyperparameter Tuning:**
   - GridSearchCV used for optimizing parameters.
4. **Performance Metrics:**
   - **RMSE:** XYZ
   - **MAE:** XYZ
   - **R² Score:** XYZ

### 🏆 Final Model Deployment
- The trained model predicts insurance charges based on user inputs.
- Implements a user-friendly input function for real-time predictions.

```python
# Predict function
def predict_insurance(age, bmi, children, sex, smoker, region, model):
    import pandas as pd
    data = pd.DataFrame([[age, bmi, children, sex, smoker, region]], 
                        columns=['age', 'bmi', 'children', 'sex', 'smoker', 'region'])
    prediction = model.predict(data)[0]
    return f"Estimated Insurance Charges: ₹{prediction:.2f}"
```

---

## 📌 Business Recommendations
✔ Implement dynamic pricing based on age, BMI, and smoking status.
✔ Offer discounts to encourage healthier lifestyles.
✔ Regional risk factors should be considered in policy pricing.
✔ Gender-based pricing should be carefully evaluated to align with regulatory norms.

---

## 📎 Repository Structure
```
📂 MediBuddy_Insurance_Analysis
 ├── 📁 data
 │   ├── insurance_data.csv
 ├── 📁 notebooks
 │   ├── exploratory_data_analysis.ipynb
 │   ├── model_training.ipynb
 ├── 📁 src
 │   ├── model.py
 │   ├── preprocess.py
 ├── README.md (This File)
```

## 💡 Future Improvements
🔹 Experiment with deep learning models for better accuracy.
🔹 Deploy as a Flask API for real-world integration.
🔹 Integrate additional health metrics like blood pressure or medical history.

---

## 🔗 Connect With Me
[GitHub](#) | [LinkedIn](#) | [Portfolio](#)
