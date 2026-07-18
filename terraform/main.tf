# enable cloud api
resource "google_project_service" "apis" {
  for_each = toset([
    "storage.googleapis.com",
    "bigquery.googleapis.com"
  ])

    service = each.value

  disable_on_destroy = false
}

# Current project information to pull numeric project ID

data "google_project" "project" {}



# Google storage account

resource "google_storage_bucket" "full_gcp_airflow_123456" {
  name     = "full_project_gcp_gcs_airflow"
  location = "europe-west2"
  force_destroy = true

  uniform_bucket_level_access = true
}

resource "google_bigquery_dataset" "full_gcp_airflow_123456" {
  dataset_id                  = "full_project_gcp_bq_airflow"
  friendly_name               = "test"
  description                 = "This dataset contains a information on a workforce"
  location                    = "europe-west2"
  default_table_expiration_ms = 3600000
}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.full_gcp_airflow_123456.dataset_id
  table_id   = "workforce_data"

  deletion_protection = false

  schema = local.table_schema
}