# Layoffs Data Cleaning & Exploratory Data Analysis using MySQL

## 📌 Project Overview

This project focuses on cleaning and analyzing a layoffs dataset using MySQL.

The project follows an end-to-end data analytics workflow, including data cleaning, data standardization, handling missing values, removing duplicates, exploratory data analysis, and extracting insights from the dataset.

## 🛠️ Tools & Technologies

- MySQL
- MySQL Workbench
- SQL
- Git
- GitHub

## 📂 Project Structure

```text
layoffs-data-analysis-mysql/
│
├── data/
│   └── layoffs.csv
│
├── sql/
│   ├── 01_data_cleaning.sql
│   └── 02_exploratory_data_analysis.sql
│
├── screenshots/
│   ├── company_analysis.png
│   ├── industry_analysis.png
│   ├── yearly_analysis.png
│   ├── monthly_rolling_analysis.png
│   └── top_companies_by_year.png
│
└── README.md


🧹 Data Cleaning

The raw layoffs dataset was cleaned using SQL through the following steps:

Created a staging table for data cleaning.
Identified and removed duplicate records using ROW_NUMBER().
Trimmed unnecessary spaces from company and country values.
Standardized industry values.
Standardized country values.
Converted date values into the proper DATE format.
Filled missing industry values where matching company information was available.
Converted blank industry values to NULL.
Removed records where both total_laid_off and percentage_laid_off were missing.
Removed the temporary row_num column after duplicate removal.
🔎 Exploratory Data Analysis

The cleaned dataset was analyzed to understand layoffs across different dimensions.

The analysis includes:

Maximum total layoffs and percentage laid off.
Companies with 100% reported layoffs.
Total layoffs by company.
Total layoffs by industry.
Total layoffs by year.
Total layoffs by company stage.
Monthly layoffs.
Rolling total layoffs over time.
Company-wise yearly layoffs.
Top 5 companies by layoffs for each year.
📊 Key Analysis
Layoffs by Company

The analysis identified companies with high total reported layoffs, including:

Amazon
Google
Meta
Salesforce
Microsoft
Philips
Ericsson
Uber
Dell
Booking.com
Layoffs by Industry

The analysis grouped reported layoffs by industry.

Industries with higher total reported layoffs in the analyzed dataset include:

Consumer
Retail
Other
Transportation
Finance
Healthcare
Food
Real Estate
Layoffs by Year

The yearly analysis shows the total reported layoffs across the years available in the dataset.

Rolling Total

A SQL window function was used to calculate the cumulative number of reported layoffs over time.

Top Companies by Year

DENSE_RANK() was used to identify the top companies by reported layoffs for each year.

📸 Project Screenshots

Selected MySQL query results are included in the screenshots folder to demonstrate the analysis performed in this project.

📚 SQL Concepts Used
SELECT
WHERE
GROUP BY
ORDER BY
HAVING
UPDATE
DELETE
ALTER TABLE
CREATE TABLE
INSERT INTO
TRIM
LIKE
JOIN
Common Table Expressions (CTEs)
Window Functions
ROW_NUMBER()
DENSE_RANK()
SUM()
MAX()
MIN()
SUBSTRING()
YEAR()
STR_TO_DATE()

#Project Objective

The objective of this project is to demonstrate practical SQL and data analytics skills by taking a raw layoffs dataset through a complete data cleaning and exploratory analysis workflow and extracting meaningful patterns from the data.

👤 Author

Yatham Uma Maheshwar Reddy

Aspiring Data Analyst | SQL | Excel | Python | Power BI | Tableau
