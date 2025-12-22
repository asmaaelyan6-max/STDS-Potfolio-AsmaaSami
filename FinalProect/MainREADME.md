Task A: ETL Architecture Diagram
The ETL pipeline starts with smart meters generating raw CSV data. The data is stored in raw
storage, then automatically triggers the transformation layer. Cleaned and validated data is stored
in structured storage and archived in Parquet format. Failure paths include retries and error logging.
Task B: Transformation Logic & Business Rules
1. If the energy unit is Watt (W), divide the value by 1000 and convert it to Kilowatt (kW).
2. If an energy reading is NULL, flag the record and exclude it from peak usage calculations.
3. If the energy value is negative, mark the record as invalid.
4. If a meter reports zero consumption for an unusually long period, mark it as potentially faulty.
5. If a reading is extremely higher than historical averages, flag it as an outlier.
Task C: Single Record Lifecycle
1. A smart meter uploads a single energy record in CSV format.
2. The record is stored in raw storage.
3. Uploading the file triggers the ETL process automatically.
4. The system cleans the data and converts units if needed.
5. Validation checks are applied to ensure data quality.
6. Valid records are stored in a structured relational database.
7. The record is converted to Parquet format and archived for analytics.
8. If any step fails, the system retries and logs the error
