# Scenario
You are a data engineer at a data analytics consulting company. You have been assigned to a project that aims to de-congest the national highways by analyzing the road traffic data from different toll plazas. Each highway is operated by a different toll operator with different IT setup that use different file formats. Your first job is to collect data available in different formats and, consolidate it into a single file.

As a vehicle passes a toll plaza, the vehicle's data like vehicle_id,vehicle_type,toll_plaza_id and timestamp are streamed to Kafka. Your second job is to create a data pipe line that collects the streaming data and loads it into a database.

# Tasks
The following tasks will be performed
1. ETL with Airflow
   - Task 1.1: Define DAG arguments
   - Task 1.2: Define the DAG
   - Task 1.3: Create a task to download data
   - Task 1.4: Create a task to extract data from csv file
   - Task 1.5: Create a task to extract data from tsv file
   - Task 1.6: Create a task to extract data from fixed width file
   - Task 1.7: Create a task to consolidate data extracted from previous tasks
   - Task 1.8: Transform the data
   - Task 1.9: Define the task pipeline
   - Task 1.10: Submit the DAG
   - Task 1.11: Unpause the DAG
   - Task 1.12: Monitor the DAG

2. Event streaming with Kafka
   - Task 2.1: Start Zookeeper
   - Task 2.2: Start Kafka server
   - Task 2.3: Create a topic named toll
   - Task 2.4: Download the Toll Traffic Simulator
   - Task 2.5: Configure the Toll Traffic Simulator
   - Task 2.6: Run the Toll Traffic Simulator
   - Task 2.7: Configure streaming_data_reader.py
   - Task 2.8: Run streaming_data_reader.py
   - Task 2.9: Health check of the streaming data pipeline
