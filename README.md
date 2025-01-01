# Cyclistic Customer Behaviors Analysis

## Table of Contents
1. [Introduction](#1-introduction)  
   1.1. [Summary](#11-summary)  
   1.2. [About the Company](#12-about-the-company)  
   1.3. [Business Questions](#13-business-questions)  
   1.4. [Data Source](#14-data-source)  
2. [Data Analysis Process](#2-data-analysis-process)  
   2.1. [Data Collection (Python)](#21-data-collection-python)  
   2.2. [Data Cleaning and Manipulation (SQL)](#22-data-cleaning-and-manipulation-sql)  
      - 2.2.1. [Detect and Remove Duplicates](#221-detect-and-remove-duplicates)  
      - 2.2.2. [Remove Data Errors](#222-remove-data-errors)  
   2.3. [Data Analysis (SQL)](#23-data-analysis-sql)  
   2.4. [Data Visualization](#24-data-visualization)  
   2.5. [Key Insights and Recommendations](#25-key-insights-and-recommendations)  
      - 2.5.1. [Key Insights](#251-key-insights)  
      - 2.5.2. [Recommendation for Marketing Strategies](#252-recommendation-for-marketing-strategies)  
3. [Conclusion](#3-conclusion)  

---

## 1. Introduction

### 1.1. Summary
This project analyzes Cyclistic’s one-year bike ride data from Chicago, aiming to identify key differences between casual riders and annual members. The goal is to help the marketing team understand customer behaviors and develop strategies to convert casual riders into annual members, which is critical for the company’s growth and sustainability.

[Read More About the Case Study](/Case%20Study%201_How%20does%20a%20bike-shared%20navigate%20speedy%20success_.pdf)

### 1.2. About the Company
Cyclistic, launched in 2016, operates a popular bike-share program in Chicago. The program has expanded to include over 5,800 bicycles and 692 stations across the city. Customers can rent bikes through single-ride, full-day passes, or annual memberships. Annual members are key to the business model, but casual riders account for a significant portion of usage. 

### 1.3. Business Questions
Three questions guide the analysis:
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders purchase Cyclistic annual memberships?
3. How can Cyclistic leverage digital media to convert casual riders into members?

### 1.4. Data Source
The dataset used for this analysis consists of Cyclistic’s historical ride data, covering the period from December 2023 to November 2024. The dataset includes columns such as ride ID, ride start and end times, location coordinates, and membership status (casual or annual).

[Dataset Source](https://divvy-tripdata.s3.amazonaws.com/index.html)

---

## 2. Data Analysis Process

### 2.1. Data Collection (Python)
Using **Pandas** and **OS** libraries in Python, I collected and merged monthly ride data from December 2023 to November 2024 into a single dataset. The Python script for this task can be found in the [Combine_Datasets](/Combine_Datasets.ipynb).

### 2.2. Data Cleaning and Manipulation (SQL)

#### 2.2.1. Detect and Remove Duplicates
I identified duplicate rows in the dataset caused by system errors, particularly in the timestamp fields (`started_at` and `ended_at`). These duplicates were removed by stripping milliseconds from the datetime fields and updating the table to retain only distinct rows.

#### 2.2.2. Remove Data Errors
Some rows contained invalid data, such as ride start times later than the end times. These rows were removed to ensure data integrity.

- **Original dataset**: 5,906,269 rows
- **Cleaned dataset after removing duplicates and data errors**: 5,905,278 rows (991 rows deleted)

*Note: Rows with null values in start and end locations were retained since they still contained valid latitude and longitude data.*

### 2.3. Data Analysis (SQL)
Using SQL queries, I analyzed the cleaned dataset to uncover patterns and trends, including:
- Seasonal fluctuations (peaking in summer)
- Differences in usage between casual riders and annual members (e.g., ride duration, time of day)
- Ride location preferences and their correlation with rider type

__Key findings include:__
- Casual riders account for about 37% of the total rides.
- Casual riders tend to use bikes more on weekends and for longer durations compared to members.
- Members prefer weekdays and shorter, more frequent rides.

### 2.4. Data Visualization
I used **Tableau** to create visualizations highlighting key differences in usage patterns between casual riders and annual members. The visualizations emphasize ride locations, time of day, and ride duration. You can explore the visualizations on [Tableau Public](https://public.tableau.com/app/profile/aimee.le9707/viz/CyclisticDashboard_17343165311580/Dashboard1).

### 2.5. Key Insights and Recommendations

#### 2.5.1. Key Insights
1. **Seasonal Demand**: Bike usage peaks during the summer months (June to September).
2. **Casual Riders' Behavior**: Casual riders are more likely to use the service on weekends and for longer durations.
3. **Preferred Bike Types**: Both casual and member riders prefer electric bikes, which should be a focus of marketing efforts.
4. **Location Patterns**: Specific locations like Streeter Dr & Grand Ave see higher proportions of casual riders, providing targeted marketing opportunities.

#### 2.5.2. Recommendation for Marketing Strategies
To convert casual riders into annual members, I recommend:
1. **Exclusive Benefits for Annual Members**: Provide discounts, free trial days, and member-only perks.
2. **Localized Marketing**: Run location-based campaigns to target casual riders at high-traffic areas, especially during peak times.
3. **Electric Bike Focus**: Highlight the convenience and benefits of electric bikes in marketing campaigns.
4. **Loyalty Programs**: Reward frequent casual riders with discounts on annual memberships after a certain number of rides.

---

## 3. Conclusion
The analysis reveals distinct behavioral differences between casual and annual riders, with casual riders tending to use the service for leisure and annual members for regular commuting. By leveraging key insights such as seasonal peaks, ride duration patterns, and location preferences, Cyclistic can implement targeted marketing strategies to increase the conversion rate of casual riders to annual members. The suggested marketing strategies, including exclusive member benefits, localized campaigns, and loyalty programs, will help Cyclistic achieve its goal of growing its annual membership base.

---

