

# Zomato Restaurant Clustering and Sentiment Analysis

![image](https://github.com/user-attachments/assets/22e18428-f745-4e31-933f-15b7b6e8cb0c)



## Overview
This project focuses on analyzing Zomato restaurant data to perform clustering and sentiment analysis. The goal is to group restaurants based on their features and analyze customer reviews to understand the sentiment behind them. The project is implemented in Python using Jupyter Notebook.

## Table of Contents
1. [Project Description](#project-description)
2. [Dataset](#dataset)
3. [Libraries Used](#libraries-used)
4. [Methodology](#methodology)
5. [Results](#results)
6. [How to Run](#how-to-run)
7. [Contributing](#contributing)
8. [License](#license)

## Project Description
The project involves:
- **Data Preprocessing**: Cleaning and preparing the Zomato dataset for analysis.
- **Exploratory Data Analysis (EDA)**: Visualizing and understanding the dataset.
- **Clustering Analysis**: Grouping restaurants based on features like cuisine, location, price range, etc.
- **Sentiment Analysis**: Analyzing customer reviews to determine positive, negative, or neutral sentiments.

## Dataset
The dataset used in this project is from Zomato, which includes information about restaurants, their locations, cuisines, price ranges, and customer reviews.

## Libraries Used
- **Pandas**: For data manipulation and analysis.
- **NumPy**: For numerical computations.
- **Matplotlib & Seaborn**: For data visualization.
- **Scikit-learn**: For machine learning algorithms and clustering.
- **WordCloud**: For generating word clouds from text data.

## Methodology
1. **Data Preprocessing**:
   - Handling missing values.
   - Encoding categorical variables.
   - Normalizing numerical features.

2. **Exploratory Data Analysis (EDA)**:
   - Visualizing the distribution of restaurants.
   - Analyzing the most popular cuisines.
   - Understanding the price range distribution.

3. **Clustering Analysis**:
   - Using K-Means clustering to group restaurants.
   - Determining the optimal number of clusters using the Elbow Method.

4. **Sentiment Analysis**:
   - Preprocessing text data (tokenization, stemming, etc.).
   - Using NLTK's VADER for sentiment analysis.
   - Visualizing sentiment distribution.

## Results
- **Clustering**: Restaurants were grouped into clusters based on their features, providing insights into different types of restaurants.
- **Sentiment Analysis**: Customer reviews were analyzed to determine the overall sentiment, helping to understand customer satisfaction.

## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/NafisAnsari786/PortfolioProjects.git
