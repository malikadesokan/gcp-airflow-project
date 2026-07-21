import pendulum
from datetime import timedelta
from config import (
  schema_fields,gcs_bucket_name, gcs_file_name, data_source_path,project_id
)


from airflow import DAG

from airflow.providers.google.cloud.transfers.gcs_to_bigquery import GCSToBigQueryOperator

from airflow.providers.google.cloud.transfers.local_to_gcs import LocalFilesystemToGCSOperator

# Define the default_args
default_dags={
    'owner':'ade_demo',
    'depends_on_past' : False,
    'start_date': pendulum.datetime(2026, 7, 14),
    'retries':2,
    'retry_delay':timedelta(minutes=3)
}

# Define the basic parameters of the DAG, like schedule and start_date
with DAG(dag_id='hrh_ade',
    #start_date=pendulim.datetime(2026, 7, 12),
    schedule="@hourly",
    catchup=False,
    default_args=default_dags,
    #tags=["example"],
) as dag:

    upload_csv_file_to_gcs = LocalFilesystemToGCSOperator(
        task_id = 'csv_upload',
        bucket = gcs_bucket_name,
        src = data_source_path,
        dst = "incoming/"
    )

    load_gcs_to_bq = GCSToBigQueryOperator(
        task_id='load_gcs_data_to_bq',
        bucket=gcs_bucket_name,
        source_objects=["*.csv"],
        destination_project_dataset_table=f"{project_id}.ade_demo_bigquery.practice_table",
        schema_fields=schema_fields,
        skip_leading_rows=1,
        source_format="CSV",
        write_disposition="WRITE_TRUNCATE",
        autodetect=False
    )

(
    upload_csv_file_to_gcs
    >> load_gcs_to_bq
)