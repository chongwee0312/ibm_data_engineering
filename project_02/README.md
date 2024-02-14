# Introduction
In this project, a complete ETL pipeline will be created to access a real-world data and process it to meet the requirements.

# Scenario
A research organization requests one of their data engineers to create a code that can be used to compile the list of the top 10 largest banks in the world ranked by market capitalization in billion USD. Further, the data needs to be transformed and stored in GBP, EUR and INR as well, in accordance with the exchange rate information that has been made available to you as a CSV file. The processed information table is to be saved locally in a CSV format and as a database table.

The job is to create an automated system to generate this information so that the same can be executed in every financial quarter to prepare the report.

Particulars of the code to be made have been shared below.
| Parameter                   | Value                                                                                                               |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------|
| Code name                   | banks_project.py                                                                                                    |
| Data URL                    | [List of Largest Banks](https://web.archive.org/web/20230908091635/https://en.wikipedia.org/wiki/List_of_largest_banks) |
| Exchange rate CSV path      | [Exchange Rate CSV](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMSkillsNetwork-PY0221EN-Coursera/labs/v2/exchange_rate.csv) |
| Table Attributes (Extraction)| Name, MC_USD_Billion                                                                                                |
| Table Attributes (Final)    | Name, MC_USD_Billion, MC_GBP_Billion, MC_EUR_Billion, MC_INR_Billion                                                |
| Output CSV Path             | ./Largest_banks_data.csv                                                                                            |
| Database name               | Banks.db                                                                                                            |
| Table name                  | Largest_banks                                                                                                       |
| Log file                    | code_log.txt                                                                                                        |

# Tasks
1. Write a function log_progress() to log the progress of the code at different stages in a file code_log.txt. Use the list of log points provided to create log entries as every stage of the code.
2. Extract the tabular information from the given URL under the heading 'By market capitalization' and save it to a dataframe.
   - Inspect the webpage and identify the position and pattern of the tabular information in the HTML code
   - Write the code for a function extract() to perform the required data extraction.
   - Execute a function call to extract() to verify the output.
3. Transform the dataframe by adding columns for Market Capitalization in GBP, EUR and INR, rounded to 2 decimal places, based on the exchange rate information shared as a CSV file.
   - Write the code for a function transform() to perform the said task.
   - Execute a function call to transform() and verify the output.
4. Load the transformed dataframe to an output CSV file. Write a function load_to_csv(), execute a function call and verify the output.
5. Load the transformed dataframe to an SQL database server as a table. Write a function load_to_db(), execute a function call and verify the output.
6. Run queries on the database table. Write a function load_to_db(), execute a given set of queries and verify the output.
7. Verify that the log entries have been completed at all stages by checking the contents of the file code_log.txt.
