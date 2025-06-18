# 📊 Amazon Prime Video EDA (Exploratory Data Analysis)

This project focuses on analyzing the Amazon Prime Video dataset to extract meaningful insights into the platform's content strategy, distribution trends, and other key factors influencing its streaming offerings. It includes thorough data cleaning, preprocessing, and visual storytelling using Python.

---

## 🔍 Objective

The primary goal is to perform **Exploratory Data Analysis (EDA)** on the Amazon Prime dataset to:

- Understand the type of content available (Movies vs TV Shows)
- Explore release year trends and content addition timelines
- Analyze content ratings, genres, and durations
- Identify top contributing countries and actors
- Uncover patterns in titles, descriptions, and data inconsistencies

---

## 📁 Dataset

The dataset used in this project was sourced from Kaggle and contains the following features:

- `title`: Name of the show/movie
- `type`: Movie or TV Show
- `release_year`: Year of original release
- `date_added`: When it was added to Prime
- `rating`: Content rating (e.g., PG, TV-MA)
- `duration`: Duration in minutes or seasons
- `country`: Country of origin
- `listed_in`: Genre categories
- `cast`, `director`, `description`: Metadata about content

> Dataset size: ~124300 entries  
> Format: `.csv`

---

## 🧰 Tech Stack

| Tool/Library      | Usage                             |
|------------------|------------------------------------|
| **Python**        | Core programming language          |
| **Pandas**        | Data manipulation and preprocessing |
| **NumPy**         | Numerical operations               |
| **Matplotlib**    | Data visualization (basic plots)   |
| **Seaborn**       | Advanced and aesthetic visualizations |
| **Jupyter Notebook** | Interactive development and visualization |

---

## 📊 Key Insights

- **Content Type Distribution**: Majority of content on Prime is **Movies**.
- **Content Over Time**: Prime significantly increased its library after 2016.
- **Top Countries**: Most content originates from the **United States**, followed by **India** and the **UK**.
- **Content Ratings**: Ratings like **TV-MA** and **PG-13** dominate, suggesting a focus on mature content.
- **Duration Analysis**: Movie durations center around 90–120 minutes.
- **Most Frequent Actors**: Insights into recurring cast members in Prime's catalog.
- **Missing Values**: Strategic handling of missing `cast`, `director`, and `country` values.

---

## 📸 Sample Visuals

- Bar plots of Movies vs TV Shows
- Heatmaps of correlation matrices
- Word clouds for content titles or descriptions
- Distribution plots for content durations
- Country-wise content contribution bar charts

---

## ✅ Conclusion

This EDA helps Amazon Prime stakeholders, data analysts, and content strategists better understand platform trends and user offerings. Such insights could assist in tailoring content acquisition strategies, genre preferences, and regional focus.

---

## 📌 Future Scope

- Build a recommendation system using metadata
- Sentiment analysis on descriptions or external reviews
- Compare Prime Video with Netflix, Hulu, or Disney+ datasets
- Time-series forecasting for future content additions

---

## 📁 Project Structure

```bash
📦 Amazon Prime EDA
 ┣ 📜 Amazon Prime EDA.ipynb   # Jupyter notebook containing full EDA
 ┣ 📊 Dataset.csv               # Source dataset
 ┗ README.md                   # Project documentation
