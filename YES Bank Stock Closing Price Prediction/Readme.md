## **YES Bank Stock Closing Price Prediction**
![image](https://github.com/user-attachments/assets/54cfc315-678f-4a77-b2dd-e73cde45e148)

This project aims to predict the closing prices of YES Bank stocks using historical data and machine learning models. The analysis involves data cleaning, exploratory data analysis (EDA), feature engineering, and model building to achieve accurate predictions.

## Table of Contents

- [Introduction](#introduction)
- [Dataset Overview](#dataset-overview)
- [Data Cleaning and Preparation](#data-cleaning-and-preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Key Insights](#key-insights)
- [Conclusion](#conclusion)
- [Technologies Used](#technologies-used)
- [Acknowledgements](#acknowledgements)

## Introduction

YES Bank is a major Indian private sector bank, and its stock prices reflect key financial trends. This project aims to analyze YES Bank's stock price data to gain insights and predict closing prices effectively.

## Dataset Overview

The dataset used in this analysis includes information about YES Bank's stock performance, such as:

- **Date**: Time series data for each stock entry.
- **Open**: Opening price of the stock.
- **High**: Highest price during the trading day.
- **Low**: Lowest price during the trading day.
- **Close**: Closing price of the stock (Target Variable).

## Data Cleaning and Preparation

To ensure data quality, the following steps were taken:

- **Handling Missing Values**: Converted Date column to datetime format and extracted Month as a categorical variable.
- **Date Conversion:**: Converted data types to appropriate formats for analysis.
- **Handling Missing Values**: Managed missing entries to ensure data completeness.
- **Feature Engineering**: Created moving average features and extracted key time-based features.

## Exploratory Data Analysis

The EDA process involved:

- **Trend Analysis**: Visualized stock price trends over time.
- **Volatility Analysis**: Identified patterns of high and low volatility.
- **Correlation Analysis**: Examined feature correlations to identify influential factors.

## Model Building

Implemented multiple models for stock price prediction:

- **Linear Regression**
- **Lasso**
- **Ridge**

## Conclusion

This project successfully analyzed YES Bank's stock price data, providing valuable insights and predictive models. The findings can help investors make informed decisions based on historical patterns and trends.

## Technologies Used

- **Python**: Programming language for data analysis.
- **Pandas**: Data manipulation and analysis library.
- **NumPy**: Numerical computing library.
- **Matplotlib** and **Seaborn**: Data visualization libraries.
- **Scikit-learn**: Machine learning frameworks.
- **Jupyter Notebook**: Interactive environment for data analysis and visualization.

## Acknowledgements

We acknowledge YES Bank's publicly available stock data for this analysis.
