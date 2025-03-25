# Airbnb Data Analysis - Ghent, Belgium

## Project Overview
This project analyzes Airbnb listing data from Ghent, Belgium to uncover insights about the local short-term rental market using Python.

## Data Sources
The analysis uses data from Inside Airbnb, specifically:
- [Listings data:](https://data.insideairbnb.com/belgium/vlg/ghent/2024-12-25/data/listings.csv.gz)
- [Calendar data: ](https://data.insideairbnb.com/belgium/vlg/ghent/2024-12-25/data/calendar.csv.gz)

## Key Features
- **Data Cleaning & Preparation**: Thorough preprocessing including handling missing values, data type conversions, and standardizing formats
- **Exploratory Data Analysis**: Multiple visualizations examining different aspects of the Airbnb market
- **Price Analysis**: Examination of pricing patterns across neighborhoods, property types, and other factors
- **Geographic Analysis**: Mapping of listings to understand spatial distribution
- **Host Behavior Analysis**: Insights on Superhost status, verification, and listing counts

## Visualizations Included
1. **Boxplot: Price Distribution by Neighborhood** - Shows price variations across different neighborhoods
2. **Scatter Plot: Price vs Number of Reviews** - Examines relationship between listing popularity and price
3. **Histogram: Distribution of Bedrooms** - Displays the frequency distribution of bedroom counts
4. **Bar Plot: Top 10 Neighborhoods by Listing Count** - Identifies most popular neighborhoods
5. **Boxplot: Bedrooms vs Price** - Shows how bedroom count affects pricing
6. **Histogram: Distribution of Prices** - Visualizes the overall price distribution
7. **Bar Plot: Superhost vs Non-superhost Count** - Compares superhost prevalence
8. **Pie Chart: Room Type Proportion** - Shows breakdown of property types
9. **Bar Chart: Average Price by Neighbourhood (Top 10)** - Highlights most expensive areas
10. **Scatter Plot: Latitude vs Longitude** - Geographic distribution with price overlay
11. **Bar Plot: Instant Bookable Listings** - Shows distribution of instant booking availability
12. **Histogram: Review Scores Rating** - Distribution of property ratings
13. **Histogram: Availability 365** - Annual availability patterns of listings
14. **Bar Plot: Average Number of Reviews per Room Type** - Shows popularity by property type
15. **Bar Chart: Verified vs Unverified Hosts** - Host verification status distribution
16. **Scatter Plot: Total Listings by Host vs Price** - Examines relationship between host inventory and pricing

## Technical Implementation
- **Language**: Python
- **Libraries**:
  - Pandas: Data manipulation and analysis
  - Matplotlib/Pyplot: Data visualization
  - NumPy: Numerical operations
  - Seaborn (implied): Advanced visualizations

## Key Insights
- Price variations across different neighborhoods reveal the most expensive and affordable areas in Ghent
- Relationship between number of reviews and pricing strategies
- Distribution patterns of property types and room configurations
- Geographic clustering of listings with price overlays
- Host verification status and its prevalence in the market
- Instant booking availability across the platform
- Seasonal availability patterns throughout the year

## Future Work
Possible extensions to this analysis could include:
- Time series analysis of pricing and availability patterns
- A new way of visualizations(for instans heat map on Ghent map)
- Convert plots to interactive plots using Dash
- Allow users to filter data and explore visualizations interactively

## How to Use This Project
1. Download the data from the provided Inside Airbnb links
2. Run the Jupyter notebook to reproduce the analysis
3. Explore specific visualizations to understand different aspects of the Ghent Airbnb market
