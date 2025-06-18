# 📊 Candidate Performance Dashboard (Power BI)

This project presents a dynamic and interactive **Power BI dashboard** that analyzes test performance data across various job roles and categories. It provides insights into candidate scores, pass rates, time spent, and performance trends to support hiring and training strategies.

---

## 🧠 Objective

To build a comprehensive dashboard that enables stakeholders to:

- Monitor overall test performance across roles
- Track pass/fail rates and scoring trends
- Identify high-performing and underperforming categories
- Evaluate time spent by test and candidate group
- Gain actionable insights for hiring decisions

---

## 🛠️ Tools Used

| Tool/Platform | Purpose |
|---------------|---------|
| **Power BI**  | Dashboard creation & visualization |
| **Excel/CSV** | Source data format |
| **DAX**       | Custom measures and calculations |
| **Power Query** | Data transformation and cleaning |

---

## 📌 Key Features

- **KPI Tiles** showing:
  - Average Score
  - Average Percentage
  - Overall Pass %  
  - Average Test Time
  - Total Time Spent

- **Interactive Filters**: Filter by `Test Name` to drill down into specific roles (e.g., MBA Interns, Java Developer, Customer Support).

- **Performance Visuals**:
  - Bar charts of score by category
  - Pass rate trends over time
  - Pass vs Fail breakdown by role
  - Total test score and time distribution
  - Candidate score range distribution

- **Pie Charts**:
  - Total time spent by test category

- **Tables**:
  - Test performance breakdown (Average, Good, Poor)
  - Category-wise performance aggregation

---

## 📸 Dashboard Snapshot

![image](https://github.com/user-attachments/assets/2c239ed4-9031-4328-860d-122ff5380286)

> Note: Image shown above is a static preview. For interactive experience, open the `.pbix` file in Power BI Desktop.

---

## 📁 File Structure

```bash
📦 Candidate Performance Dashboard
 ┣ 📊 Candidate_Performance.pbix     # Power BI report file
 ┣ 📄 README.md                      # Project documentation
 ┗ 📸 Dashboard_Screenshot.png       # Dashboard preview image
 ┗ 📸 Dataset.xlsx                   #Dataset used for dashboard
 ┗ 📸 Python script.ipynb            #To Clean the dataset
