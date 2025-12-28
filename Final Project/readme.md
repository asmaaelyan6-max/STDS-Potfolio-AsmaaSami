## 🌱 GreenStream Energy - Serverless ETL Solution
## 🔹 Solution Overview
This project presents a conceptual serverless ETL solution for processing smart meter data from 50,000 households.
The goal is to transform raw electricity usage data into analytics-ready datasets while handling real-world data issues.
## The solution enables:
⚡ Identifying peak energy consumption periods
⚠️ Detecting abnormal or faulty smart meters
📊 Preparing data for future predictive analytics
## 🏗 ETL Architecture
The ETL solution follows a serverless pipeline design:
Source: Smart meter raw data (CSV files) uploaded to the landing storage.
Transformation Layer:
Standardizes energy units (W → kW)
Handles missing readings and validates data
Detects potential faulty meters
Destinations:
Cleaned and structured data stored in RDS for querying and validation
Analytics-optimized Parquet files archived for long-term analysis
Orchestration & Error Handling:
Automatic retries on failures
Logs persistent errors for review
The pipeline ensures data is ready for analysis and reduces the risks of faulty or inconsistent records.
## 🔄 Data Transformation Logic
The core business rules applied during the Transform phase include:
⚡ Unit Standardization: Convert all readings to kW.
📝 Handling Missing Values: Flag records with null readings and exclude them from peak usage calculations.
✅ Data Validation: Ensure timestamps and units are consistent.
⚠️ Faulty Meter Detection: Identify meters reporting zero consumption for unusually long periods.
## 🧩 Single Record Lifecycle
Step-by-step flow of a smart-meter record:
Upload 📤: Raw CSV record is uploaded to landing storage.
Trigger Transformation 🚀: ETL pipeline starts automatically.
Data Cleaning & Validation 🧹: Units standardized, missing values flagged, faulty meters detected.
Structured Storage 🗃: Cleaned records stored in RDS for querying.
Archival 🗄: Data converted to Parquet format for long-term analytics.
Error Handling ❌: Failed records retried; persistent failures logged.
## 📌 Key Benefits
Prepares analytics-ready datasets from raw data
Handles real-world data quality issues automatically
Provides a scalable and fault-tolerant ETL design
