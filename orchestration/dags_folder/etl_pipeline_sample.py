from datetime import timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.postgres_operator import PostgresOperator
import airflow.utils.dates
from airflow.operators.python_operator import PythonOperator
import os
import sys
import configparser
from os import access
import psycopg2


dag = DAG(
    'etl_pipeline_sample',
    description= 'A simple ELT pipeline',
    schedule_interval=timedelta(days = 1),
    start_date = airflow.utils.dates.days_ago(1),

)

extract_orders_task = BashOperator(
    task_id = 'extract_order_data',
    bash_command= 'python /Users/brunoozaki/Desktop/vscode/data-pipelines/extract/extract_postgres_full.py',
    dag=dag,
)


load_orders_task = BashOperator(
    task_id='load_order_data',
    bash_command= 'python /Users/brunoozaki/Desktop/vscode/data-pipelines/load/copy_to_redshift.py',
    dag=dag,
)


revenue_model_task = PostgresOperator(
    task_id = 'build_data_model',
    postgres_conn_id = 'redshift_dw',
    sql =  'sql/revenue_model.sql',
    dag = dag, 

)


extract_orders_task  >> load_orders_task >> revenue_model_task