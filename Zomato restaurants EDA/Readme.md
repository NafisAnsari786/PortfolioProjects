# Zomato Restaurants Exploratory Data Analysis (EDA)

![image](https://github.com/user-attachments/assets/a789364f-6131-4e6c-94b5-3771760d6791)


This project involves performing Exploratory Data Analysis (EDA) on Zomato's restaurant data to gain insights into the restaurant industry. The analysis identifies patterns, trends, and relationships within the data, providing a better understanding of restaurant ratings, pricing, locations, and customer preferences.

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

Zomato is a popular restaurant discovery and food delivery platform that provides information about restaurants, menus, and user reviews. This project aims to analyze Zomato's restaurant data to uncover valuable insights that can benefit both customers and restaurant owners.

## Dataset Overview

The dataset used in this analysis includes information about various restaurants, such as:

- **Restaurant ID**: Unique identifier for each restaurant.
- **Restaurant Name**: Name of the restaurant.
- **Country Code**: Numerical code representing the country.
- **City**: City where the restaurant is located.
- **Address**: Physical address of the restaurant.
- **Locality**: Specific locality within the city.
- **Longitude**: Longitude coordinate of the restaurant's location.
- **Latitude**: Latitude coordinate of the restaurant's location.
- **Cuisines**: Types of cuisines offered by the restaurant.
- **Average Cost for Two**: Average cost for a meal for two people.
- **Currency**: Currency of the average cost.
- **Has Table Booking**: Indicates if the restaurant accepts table bookings.
- **Has Online Delivery**: Indicates if the restaurant offers online delivery.
- **Is Delivering Now**: Indicates if the restaurant is currently delivering.
- **Switch to Order Menu**: Indicates if the restaurant has switched to an order menu.
- **Price Range**: Price range category of the restaurant.
- **Aggregate Rating**: Average user rating for the restaurant.
- **Rating Color**: Color code representing the rating.
- **Rating Text**: Textual representation of the rating (e.g., 'Excellent', 'Good').
- **Votes**: Number of votes received by the restaurant.

## Data Cleaning and Preparation

Before conducting the analysis, the dataset underwent several preprocessing steps:

- **Handling Missing Values**: Identified and addressed missing or null values to ensure data completeness.
- **Data Type Conversion**: Converted data types to appropriate formats for analysis.
- **Feature Engineering**: Created new features, such as extracting individual cuisines from the 'Cuisines' column for more detailed analysis.

## Exploratory Data Analysis

The EDA process involved:

- **Descriptive Statistics**: Calculated measures such as mean, median, and standard deviation for numerical features.
- **Data Visualization**: Utilized various plots and charts to visualize distributions, relationships, and trends within the data.
- **Correlation Analysis**: Examined correlations between numerical variables to identify significant relationships.

## Key Insights

- **Top Cuisines**: Identified the most popular cuisines offered by restaurants.
- **City-wise Distribution**: Analyzed the number of restaurants across different cities.
- **Rating Analysis**: Explored the distribution of aggregate ratings and identified factors influencing higher ratings.
- **Cost Analysis**: Investigated the average cost for two people across various cities and cuisines.
- **Booking and Delivery**: Assessed the impact of table booking and online delivery options on restaurant ratings and popularity.

## Conclusion

The analysis provided valuable insights into customer preferences and restaurant performance. Key findings include:

- Cities with the highest number of restaurants.
- Cuisines that are most commonly offered.
- Factors that contribute to higher customer ratings.
- The relationship between average cost and restaurant ratings.

These insights can help restaurant owners make data-driven decisions to enhance their services and cater to customer preferences effectively.

## Technologies Used

- **Python**: Programming language for data analysis.
- **Pandas**: Data manipulation and analysis library.
- **NumPy**: Numerical computing library.
- **Matplotlib** and **Seaborn**: Data visualization libraries.
- **Jupyter Notebook**: Interactive environment for data analysis and visualization.

## Acknowledgements

We acknowledge Zomato for providing the dataset used in this analysis. 

