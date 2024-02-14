# Import the libraries

from datetime import timedelta
# The DAG object to instantiate a DAG
from airflow import DAG
# The Operator to write tasks
from airflow.operators.bash_operator import BashOperator
# Make scheduling easy
from airflow.utils.dates import days_ago

# Define the DAG arguments
default_args = {
    'owner': 'Chan Chong Wee',
    'start_date': days_ago(0),
    'email': ['chanchongwee900312@gmail.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Define the DAG
dag = DAG(
    'ETL_toll_data',
    default_args=default_args,
    description='Apache Airflow Final Assignment',
    schedule_interval=timedelta(days=1),
)

# Define the task 'unzip_data'
unzip_data = BashOperator(
    task_id='unzip_data',
    bash_command="tar -xzf /home/project/airflow/dags/finalassignment/tolldata.tgz",
    dag=dag,
)

# Define the task 'extract_data_from_csv'
extract_data_from_csv = BashOperator(
    task_id='extract_data_from_csv',
    bash_command="cut -d',' -f1-4 /home/project/airflow/dags/finalassignment/vehicle-data.csv > \
                  /home/project/airflow/dags/finalassignment/csv_data.csv",
    dag=dag,
)

# Define the task 'extract_data_from_tsv'
extract_data_from_tsv = BashOperator(
    task_id='extract_data_from_tsv',
    bash_command="cut -f5-7 /home/project/airflow/dags/finalassignment/tollplaza-data.tsv | tr '\t' ',' | sed '$!s/.$//' > \
                  /home/project/airflow/dags/finalassignment/tsv_data.csv",
    dag=dag,
)

# Define the task 'extract_data_from_fixed_width'
extract_data_from_fixed_width = BashOperator(
    task_id="extract_data_from_fixed_width",
    bash_command="cut -c59-67 /home/project/airflow/dags/finalassignment/payment-data.txt | tr ' ' ',' > \
                  /home/project/airflow/dags/finalassignment/fixed_width_data.csv",
    dag=dag,
)

# Define the task 'consolidate_data'
consolidate_data = BashOperator(
    task_id='consolidate_data',
    bash_command="paste -d',' /home/project/airflow/dags/finalassignment/csv_data.csv \
                  /home/project/airflow/dags/finalassignment/tsv_data.csv \
                  /home/project/airflow/dags/finalassignment/fixed_width_data.csv > \
                  /home/project/airflow/dags/finalassignment/extracted_data.csv",
    dag=dag,
)

# Define the task 'transform_data'
transform_data = BashOperator(
    task_id='transform_data',
    bash_command="awk 'BEGIN{OFS=FS=\",\"} {$4=toupper($4)} 1' /home/project/airflow/dags/finalassignment/extracted_data.csv > \
                  /home/project/airflow/dags/finalassignment/transformed_data.csv",
    dag=dag,
)

# Define the task pipeline
unzip_data >> extract_data_from_csv >> extract_data_from_tsv >> extract_data_from_fixed_width >> consolidate_data >> transform_data
