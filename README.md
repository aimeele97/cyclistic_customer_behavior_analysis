# Cyclistic Customer Behavior Analysis

# Table of Contents

<!-- TOC -->

- [Project Background](#project-background)
- [Data Structure & Initial Checks](#data-structure--initial-checks)  
- [Executive Summary](#executive-summary)  
- [Insights Deep Dive](#insights-deep-dive)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)

<!-- /TOC -->

# Project Background
As part of the __Google Data Analytics Certificate__, this project analyzes Cyclistic’s one-year bike ride data to identify key differences in usage patterns between casual riders and annual members. The goal is to provide actionable insights that help the marketing team develop targeted strategies to convert casual riders into annual members, which is essential for Cyclistic's growth and long-term sustainability.

Cyclistic is launched in 2016, operates a widely-used bike-share program in Chicago with over 5,800 bikes and 692 stations across the city. Customers can rent bikes via single rides, full-day passes, or annual memberships. While annual members are vital to the company’s business model, casual riders represent a significant portion of overall usage.

[Read More About the Case Study Here](/Case%20Study%201_How%20does%20a%20bike-shared%20navigate%20speedy%20success_.pdf)

Insights and recommendations are provided on the following key areas:

- **Category 1**: Ride patterns by hour of the day, day of the week, and season for casual users and members
- **Category 2**: Most popular bike types for casual users and members
- **Category 3**: Most popular ride locations for casual users and members
- **Category 4**: Average ride duration (minutes) by day of the week and hour of the day for members and casual riders  

Data sources can be found here [link](https://divvy-tripdata.s3.amazonaws.com/index.html).  
  
The Python script used to integrate 12-month CSV file data (from December 2023 to November 2024) can be found here [link](./Combine_Datasets.ipynb).  
  
The SQL queries used to inspect and clean the data for this analysis can be found here [link](Data_Cleaning.sql).  

The SQL queries regarding various business questions can be found here [link](Data_Analysis.sql).

An interactive Tableau dashboard used to report and explore ride trends can be found here [link](https://public.tableau.com/app/profile/aimee.le9707/viz/CyclisticDashboard_17343165311580/Dashboard1).
  
# Data Structure & Initial Checks

For scope of this project, I only created a single table in the cyclistic database for analysis. The table contains columns: `rides_id, riable_type, arted_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat, start_lng, end_lat, end_lng, member_casual`

There are 5,906,269 records and 13 variables in the table.

![alt text](img/img1.png)

__Desplay the first 10 rows of the table__

![img](img/img.png)

__Data cleaning and transformation code__

![alt text](img/image.png)
![alt text](img/image-1.png)
  
There were some null values in the start and end locations; however, these rows still contained valid latitude and longitude data. Since this does not affect my analysis, I decided to not delete these rows.
  
The table after cleaning has 5,905,278 records (991 rows were deleted)
  
# Executive Summary

### Overview of Findings

The data reveals that casual riders account for 36.65% of total rides, with electric bikes being the most popular choice, comprising 50.66% of all rides. Key trends show that summer is the peak season, and casual riders tend to use bikes on weekends, while members prefer mid-week rides, particularly Wednesdays. Additionally, casual riders have longer ride durations (approximately 25 minutes vs. 13 minutes for members) and exhibit distinct travel patterns, with notable differences in departure and destination locations, such as the dominance of casual rides at the 'Streeter Dr & Grand Ave' station.

![Visualization](img/img2.png)

# **Insights Deep Dive**

### Category 1: Ride patterns by hour of the day, day of the week, and season for casual users and members

- **Main insight 1:** Casual riders exhibit clear seasonal patterns, with a significant peak during the summer months (June to September). Winter months (December to March) show a noticeable dip in ridership, suggesting a strong correlation between weather and demand for leisure rides.

- **Main insight 2:** Member rides are most frequent during weekdays, especially Wednesdays, with the majority of rides occurring during business hours. This aligns with the assumption that members primarily use the bikes for commuting, suggesting potential opportunities to optimize service availability during these peak weekday hours.

- **Main insight 3:** Casual riders tend to use the service more on weekends, with their highest activity observed on Saturdays and Sundays. This reinforces the idea that casual riders primarily use the service for leisure activities and are less likely to need bikes during work hours.

- **Main insight 4:** Both casual and member riders have a high concentration of activity in the late afternoon to early evening, particularly between 4:00 PM and 7:00 PM. This suggests a peak in demand for both types of riders during these hours, potentially influenced by work commutes and leisure activities after the workday ends.

  ![alt text](img/image-3.png)

### **Category 2: Most popular bike types for casual users and members

- **Main insight 1:** Electric bikes are the preferred choice for both casual and member riders, accounting for the majority of rides. This preference indicates a general trend toward convenience and ease of use, especially for longer rides or more demanding terrain.

- **Main insight 2:** While electric bikes dominate both groups, electric scooters are more popular among casual riders than members. This suggests that casual riders are more likely to opt for a faster, smaller, and more convenient mode of transportation for shorter, leisure-focused rides.

- **Main insight 3:** Classic bikes account for a smaller but still significant proportion of rides, with a higher preference among members. This may suggest that members use classic bikes for more routine, practical commuting, whereas casual riders prefer the electric bike or scooter for recreational use.

- **Main insight 4:** The higher frequency of electric bike usage among both groups emphasizes an opportunity to focus on electric bike offerings in marketing and promotional campaigns, as it appeals to both casual and member riders.  

   <img src="img/image-4.png" alt="alt text" width="350" height="650"/>

### Category 3: Most popular ride locations for casual users and members

- **Main insight 1:** Casual riders tend to dominate high-traffic, leisure-oriented locations, such as "Streeter Dr & Grand Ave," where the highest concentration of casual rider activity is observed. This suggests a preference for scenic or recreational routes among casual users.

- **Main insight 2:** Locations like "Michigan Ave & Oak St" show a stronger presence of member riders. These areas could be viewed as more business or commuter-focused, with members using the service primarily for work-related purposes.

- **Main insight 3:** Despite casual riders comprising 36.65% of total rides, they contribute significantly to top ride locations, such as "Streeter Dr & Grand Ave." This indicates a need to explore marketing strategies that target casual riders at these high-traffic locations, with an eye toward converting them into members.

- **Main insight 4:** The geographic analysis highlights a potential strategy for targeting specific locations where casual riders dominate, such as popular tourist spots or recreational areas, with localized promotions or membership incentives designed to boost conversions.

    <img src="img/image-5.png" alt="alt text" width="650" height="350"/>


### Category 4: Average ride duration (minutes) by day of the week and hour of the day for members and casual riders

- **Main insight 1:** Casual riders have an average ride duration of 25 minutes, significantly longer than the 13 minutes for members. This difference suggests that casual riders engage with the service more leisurely, possibly for activities like sightseeing or exercise.

- **Main insight 2:** Ride durations for casual riders remain fairly constant throughout the week, indicating that their usage is not highly influenced by weekdays or weekends. This contrasts with members, who have more predictable, work-related usage patterns.

- **Main insight 3:** Both casual and member riders show a preference for late afternoon to evening hours for their rides. The highest ride durations for both groups occur between 4:00 PM and 7:00 PM, suggesting that this time frame is a prime opportunity for engagement and targeted offers.

- **Main insight 4:** The longer ride durations for casual riders highlight a potential opportunity to offer tailored promotions that encourage extended use, such as discounts on longer trips or offers for those who ride during off-peak hours to balance demand.

  ![alt text](img/image-6.png)

# Recommendations:

* **Seasonal Demand (Summer Peak):**  
   Given that summer is the peak season for bike usage, particularly for casual riders, we recommend focusing marketing efforts during these months to increase visibility and drive conversions. Offer discounts or promotions during the summer to incentivize casual riders to sign up for annual memberships.

* **Leverage Electric Bike Popularity:**  
   Both casual and member riders prefer electric bikes, indicating that emphasizing electric bike options in promotional campaigns may appeal to both groups. Highlighting electric bikes as a feature of annual membership could incentivize casual riders to consider switching to a membership for better access to this popular option.

* **Target Popular Locations for Casual Riders:**  
   Since casual riders dominate certain popular locations, such as “Streeter Dr & Grand Ave,” we recommend running targeted location-based campaigns to convert these users into members. Use geofencing technology to deliver personalized membership offers to casual riders when they are at these high-traffic areas.

* **Introduce Flexible Membership Options:**  
   Since casual riders tend to ride longer and more leisurely, we recommend offering flexible membership options like "seasonal memberships" or "3-month trials" to appeal to these users who might not be ready for a full-year commitment.

* **Enhance User Experience for Longer Rides:**  
   Casual riders tend to ride longer than members, indicating a need for service features tailored to long-duration rides. This could include providing additional benefits for long rides or creating packages that focus on leisurely rides, perhaps paired with location-based offers for longer trips.

# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* **Assumption 1:** Seasonal trends were assumed based on historical data from previous years, assuming similar patterns for 2024. We anticipate similar summer peaks and winter declines in ridership.

* **Assumption 2:** Missing station names for certain locations were excluded from the visualization but retained in the analysis, as the latitude and longitude data were still valid.

* **Assumption 3:** Data anomalies, such as missing timestamps or unclear ride end locations, were excluded from the analysis to maintain accuracy and relevance.
