Business Requirements:

Create a database with 6 tables using different CSV flat files as a data source.
Create a new table to display all medical conditions in a single row (Data Aggregation) along with admission date and discharge date of each patient.
Rename all the column names in Hospital Staff table. Create a new column ‘Full Name’ based on staff first name and last name.
Create a new table from Department and Treatment tables to retrieve top 3 department names with high treatment fees.
<img width="3601" height="374" alt="image" src="https://github.com/user-attachments/assets/3acc07ab-01d4-4c30-9929-66902e18ca0b" />


<img width="3601" height="374" alt="image" src="https://github.com/user-attachments/assets/907da9a5-4388-4771-ad9c-ab1d73497b87" />

Product Name: Microsoft SQL Server
Software Version: 2025
Assumptions: The data type in the flat files is approprite which does not require any transformation on SQL sever.
Dependencies: Additional column creations and data transformations will be executed on Power BI to perform trend analysis.
Acceptance Criteria: The SQL query must return one row per patient with demographics, aggregated medical history, and admission details. All column names must follow the agreed naming convention. The query must execute successfully on SQL Server without syntax errors, avoid duplicate rows, and complete within 5 seconds on the current dataset.
Constraints: The data was imported into the server via flat files but not through excel sheets due to unavailability of this direct functionality on the installed application.



