
data_source_path = "/usr/local/airflow/dags/data/*csv"
gcs_bucket_name = 'ade-demo-bucket-123456'
gcs_file_name = 'workforce.csv'

project_id = 'de-project-495521'

schema_fields = [
    {"name" : "employee_id", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "first_name", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "last_name", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "gender", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "age", "type": "INTEGER", "mode": "NULLABLE"},
    {"name" : "department", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "job_title", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "location", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "employment_type", "type": "STRING", "mode": "NULLABLE"},
    {"name" : "salary", "type": "INTEGER", "mode": "NULLABLE"},
    {"name" : "hire_date", "type": "DATE", "mode": "NULLABLE"},
    {"name" : "email", "type": "STRING", "mode": "NULLABLE"}
]