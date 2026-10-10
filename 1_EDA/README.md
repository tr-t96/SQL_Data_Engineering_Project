# Exploratory Data Analysis w/ SQL: Job Market Analysis

![Project 1 Overview](../Images\1_1_Project1_EDA.png)

A SQL project analyzing the data engineer job market using real world job posting data. It demonstrates my ability to **write production-quality analytical SQL, design efficient queries, and turn business questions into data-driven insights**.  

## Executive Summary
- Project scope: Build **3 analytical queries** that answer key questions about the data engineer job market 
- Data modeling: Used **multi-table joins* across fact and dimention tables to extract insights
- Analytics: Applied **aggreations, filtering, and sorting** to find top skills by demand, salary and overall value  
[Top demanded skills query](1_EDA\01_top_demanded_skills.sql)  
[Top paying skills](1_EDA\02_top_paying_skills.sql)  
[Most optimal skill](1_EDA\03_most_optimal_skills.sql)
## Problem & Context 
- To decide what would be the main skillset to focus while entering data engineering career path

The structure is consist of ![Data Warehouse](../Images\1_2_Data_Warehouse.png)
- **Fact Table:**: `job_postings_fact` 
## Tech Stack
- **Query Engine:** DuckDB for fast OLAP-style analytical queries
- ***Language:** SQL
- **Data Model:*** Star schema with fact + dimension + bridge tables
- **Development:** VS Code for SQL editing + terminal for DuckDB CLI
- **Version Control:** Git/Github for versioned SQL scripts  

## Analysis Overview 

### Query Structure
1. **[Top demanded skills query](1_EDA\01_top_demanded_skills.sql)** - Identifies the 10 most in-demand skills for remote data enginerr positions  
2. **[Top paying skills](1_EDA\02_top_paying_skills.sql)** - Analysze the 25 highest-paying skills with salary and demand metrics 
3. **[Most optimal skill](1_EDA\03_most_optimal_skills.sql)** - Calculate an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn
## SQL Skills Demonstrated
- **Core languages**: SQL and Pythin each appear in ~29k jobs posting