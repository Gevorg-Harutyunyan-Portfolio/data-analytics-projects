# 📊 Netflix Data Dashboard (Google Sheets)

## 🔗 Dataset Source
[Kaggle: Netflix Movies and TV Shows Dataset](https://www.kaggle.com/datasets/shivamb/netflix-shows)

---

## 🧠 Project Objective

The goal of this project was to analyze and visualize the Netflix catalog using **Google Sheets**. The final product is a simple and semiinteractive dashboard showcasing statistics such as:
- Total content available on Netflix
- Distribution of genres
- Most common content ratings
- Yearly trends
- Country-wise availability

---

## 📂 Files in this project
- `Dashboard Screenshot.png` – A snapshot of the final Google Sheets dashboard  
- `README.md` – Description of the steps taken and how to view the dashboard

---

## 🔧 Steps Performed

### 1. Data Import
- Downloaded the Netflix dataset from Kaggle
- Imported the `.csv` file into Google Sheets

### 2. Data Cleaning
- **Removed Duplicates**
- **Filled or Removed Nulls**
- **Standardized Text**
- **Split Genre Fields**

### 3. Data Transformation
- Created helper sheets like:
  - `Cleaned` – Clean dataset
  - `DistinctTitles` – Unique movie/TV show records
  - `Genres_Exploded` – One genre per row to allow frequency counting
  - `Movies and shows by year` – Trend analysis
  - `Ratings`, `Map` – Aggregation tables for charts

### 4. Dashboard Creation
Used **Google Sheets charts** to build:
- KPI tiles (Movies & Shows, Genres, Ratings, Countries)
- Bar charts (Top 10 Genres, Top 10 Ratings)
- Donut chart (TV Shows vs Movies split)
- Geomap (Content count by Country)
- Line chart (Content over time)

### 5. Styling
- Applied a **dark theme**
- Used **custom colors** for better visual impact
- Added filters for dynamic interactivity

---
**Dasboard Link:**
[View Live Google Sheets Dashboard](https://docs.google.com/spreadsheets/d/12Pa5Kt8BgDxOrIV4N4MCPa2lR-hVoZypsN4IKoXeEfw/edit?usp=sharing)


## 🙏 Credits

Dashboard design style inspired by [DataScience RoadMap](https://www.youtube.com/@DataScienceRoadMap/community) on YouTube.  
While the original dashboard was created in Excel, I adapted the layout and visual style to Google Sheets.
