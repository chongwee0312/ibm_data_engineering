#!/usr/bin/env python
# coding: utf-8


# Code for ETL operations on largest banks data

# Importing the required libraries
import requests
from bs4 import BeautifulSoup
import pandas as pd
import numpy as np
import sqlite3
from datetime import datetime

# Define a function to show the progress log and append the log message to the log file
def log_progress(message):
    ''' This function logs the mentioned message of a given stage of the
    code execution to a log file. Function returns nothing'''
    # Timestamp format: Year-Monthname-Day-Hour:Minute:Second
    timestamp_format = '%Y-%h-%d-%H:%M:%S'

    # Get current timestamp
    timestamp = datetime.now().strftime(timestamp_format)

    # Append the log message to the log file
    with open(log_file, 'a') as f:
        f.write(f'{timestamp} : {message}\n')

# Define a function to extract the required information from the website
def extract(url, table_attribs):
    ''' This function aims to extract the required
    information from the website and save it to a dataframe. The
    function returns the dataframe for further processing. '''
    page = requests.get(url).text
    data = BeautifulSoup(page, 'html.parser')

    df = pd.DataFrame(columns=table_attribs)
    tables = data.find_all('tbody')
    rows = tables[0].find_all('tr')

    for row in rows:
        col = row.find_all('td')
        if len(col) != 0:
            bank_data = pd.DataFrame([{
                'Name': col[1].contents[2].text.strip(),
                'MC_USD_Billion': float(col[2].text.strip())
            }])
            df = pd.concat([df, bank_data], ignore_index=True)

    return df

# Define a function to perform transform process
def transform(df, csv_path):
    ''' This function accesses the CSV file for exchange rate
    information, and adds three columns to the dataframe, each
    containing the transformed version of Market Cap column to
    respective currencies'''
    rate_df = pd.read_csv(csv_path)
    exchange_rate = rate_df.set_index('Currency').to_dict()['Rate']
    
    df['MC_GBP_Billion'] = np.round(df['MC_USD_Billion'] * exchange_rate['GBP'], 2)
    df['MC_EUR_Billion'] = np.round(df['MC_USD_Billion'] * exchange_rate['EUR'], 2)
    df['MC_INR_Billion'] = np.round(df['MC_USD_Billion'] * exchange_rate['INR'], 2)
    
    return df

# Define a function to save the table in csv format
def load_to_csv(df, output_path):
    ''' This function saves the final dataframe as a CSV file in
    the provided path. Function returns nothing.'''
    df.to_csv(output_path)

# Define a function to load the table to the database
def load_to_db(df, sql_connection, table_name):
    ''' This function saves the final dataframe to a database
    table with the provided name. Function returns nothing.'''
    df.to_sql(table_name, sql_connection, if_exists='replace', index=False)

# Define a function to run the sql query and print the result
def run_query(query_statement, sql_connection):
    ''' This function runs the query on the database table and
    prints the output on the terminal. Function returns nothing. '''
    query_output = pd.read_sql(query_statement, sql_connection)
    print(query_statement)
    print(query_output)


# Initialsie the known entities
url = 'https://web.archive.org/web/20230908091635/https://en.wikipedia.org/wiki/List_of_largest_banks'
table_name = 'Largest_banks'
table_attribs = ['Name', 'MC_USD_Billion']
csv_path = 'exchange_rate.csv'
output_path = './Largest_banks_data.csv'
db_name = 'Banks.db'
log_file = 'code_log.txt'

log_progress('Preliminaries complete. Initiating ETL process')

# Extract process
df = extract(url, table_attribs)
# print(df)

log_progress('Data extraction complete. Initiating Transformation process')

# Transform process
df = transform(df, csv_path)
# print(df)

log_progress('Data transformation complete. Initiating Loading process')

# Load process
load_to_csv(df, output_path)

log_progress('Data saved to CSV file')

sql_connection = sqlite3.connect(db_name)

log_progress('SQL Connection initiated')

load_to_db(df, sql_connection, table_name)

log_progress('Data loaded to Database as a table, Executing queries')

# SQL queries
query_statement = f'SELECT * FROM {table_name}'
run_query(query_statement, sql_connection)
print()

query_statement = f'SELECT AVG(MC_GBP_Billion) FROM {table_name}'
run_query(query_statement, sql_connection)
print()

query_statement = f'SELECT Name FROM {table_name} LIMIT 5'
run_query(query_statement, sql_connection)

log_progress('Process Complete')

# Close the sql connection
sql_connection.close()

log_progress('Server Connection closed')

