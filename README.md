# 📊 Socioeconomic Data Analysis & Machine Learning (BigQuery)

## 📌 Project Overview  
This project explores socioeconomic inequality across the United States using the Broadstreet Area Deprivation Index (ADI) dataset. The work is divided into two phases:

- Data Analysis (CW1) – Data cleaning, validation, and analytical querying  
- Machine Learning (CW2) – Predictive modelling using BigQuery ML  

The goal is to transform large-scale public data into actionable insights and predictive intelligence for decision-making.

---

## 🎯 Objectives  

- Analyse deprivation patterns across U.S. states  
- Identify hidden inequalities within regions  
- Build a machine learning model to classify high-deprivation areas  
- Demonstrate an end-to-end workflow using cloud-based data tools  

---

## 🛠️ Technologies Used  

- SQL (Google BigQuery)  
- Python (Pandas, NumPy)  
- BigQuery ML  
- Google Cloud Storage (GCS)  
- Looker Studio (Data Visualisation)  

---

## 📂 Project Structure  
queries/ → SQL queries for data cleaning, validation, analysis, predictive modelling
Joined_table_dataset/ → Sample dataset (cleaned data) for analysis
adi_model_dataset/ → Sample dataset for machine learning / predictions


---

## 🔍 Phase 1: Data Analysis  

### Key Steps:
- Joined large-scale datasets (block group and county level)  
- Performed data integrity checks:
  - Missing values  
  - Duplicate records  
  - FIPS code validation  
  - Year consistency  
- Cleaned and standardised data using SQL  
- Executed analytical queries to answer:

**Which U.S. states show the greatest inequality between local and regional deprivation?**

### Key Insight:
Significant disparities exist within states, meaning county-level averages can hide severe local deprivation.

---

## 📊 Data Visualisation  

Results were visualised using Looker Studio:
- Top 10 states with highest inequality  
- Within-state variation  
- Geographic distribution (Geo map)  

These visualisations help convert raw data into clear and actionable insights.

---

## 🤖 Phase 2: Machine Learning  

### Model:
Logistic Regression (BigQuery ML)

### Objective:
Classify areas as:
- High Deprivation (1)  
- Low Deprivation (0)  

### Features Used:
- Block and county deprivation scores  
- Geographic identifiers (FIPS codes)  
- Temporal data (year)  

---

## 📈 Model Performance  

- Accuracy: ~93%  
- Precision: ~93%  
- Recall: ~93%  
- ROC AUC: ~0.99  

This indicates strong performance in identifying high-deprivation areas.

---

## 💡 Business Value  

This project demonstrates how data can support:

- Public health planning  
- Government policy and funding decisions  
- Social care resource allocation  
- Identification of high-risk communities  

---

## 🚀 Key Skills Demonstrated  

- Data cleaning and validation  
- SQL-based data engineering  
- Cloud data processing (BigQuery)  
- Data visualisation and storytelling  
- Machine learning using SQL (BigQuery ML)  
- End-to-end data pipeline development  

---

## 📌 Conclusion  

This project demonstrates how large-scale public datasets can be transformed into meaningful insights and predictive models using modern cloud technologies. It highlights the importance of combining data engineering, analytics, and machine learning to solve real-world problems.
