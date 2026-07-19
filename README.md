# Google Cloud Data Ingestion Pipeline with Airflow, Terraform & BigQuery

## Project Overview

This project demonstrates a complete end-to-end data engineering pipeline that automates the ingestion of structured CSV data into Google BigQuery using modern cloud-native technologies.

The solution provisions all required Google Cloud infrastructure using **Terraform**, orchestrates the data pipeline using **Apache Airflow (Astronomer)**, stores raw data in **Google Cloud Storage (GCS)**, and loads it into **BigQuery** where it can be queried for analytics and reporting.

The primary objective of this project is to showcase Infrastructure as Code (IaC), workflow orchestration, and cloud-based data warehousing following industry best practices.

---

## Project Architecture

![Pipeline Architecture](./_images/dec_pipeline_architecture.png)

### Architecture Flow

```
          Local CSV File
                 │
                 ▼
      Apache Airflow DAG
                 │
      LocalFilesystemToGCSOperator
                 │
                 ▼
      Google Cloud Storage (GCS)
                 │
         GCSToBigQueryOperator
                 │
                 ▼
         Google BigQuery
                 │
                 ▼
      Reporting / Analytics
```

Terraform is responsible for provisioning all required cloud resources before the Airflow pipeline is executed.

---

# Problem Statement

Many organisations still receive operational data as flat files that are manually uploaded into cloud environments. These manual processes are often:

- Time consuming
- Error-prone
- Difficult to monitor
- Hard to reproduce
- Not scalable as data volumes increase

Without an automated pipeline, maintaining data quality and ensuring datasets are consistently available for reporting becomes increasingly difficult.

This project addresses these challenges by creating an automated ingestion workflow that transfers local CSV files into Google Cloud Storage before loading them into BigQuery, while Terraform ensures all required infrastructure is created in a repeatable and version-controlled manner.

---

# Project Objectives

The project aims to:

- Automate file ingestion into Google Cloud
- Demonstrate Infrastructure as Code using Terraform
- Learn workflow orchestration using Apache Airflow
- Store raw files securely inside Google Cloud Storage
- Load structured datasets into BigQuery
- Create a reproducible cloud deployment
- Separate infrastructure management from data orchestration
- Follow modern Data Engineering best practices

---

# Technology Stack

| Technology | Purpose |
|------------|---------|
| Python | Airflow DAG development |
| Apache Airflow | Workflow orchestration |
| Astronomer CLI | Local Airflow environment |
| Terraform | Infrastructure provisioning |
| Google Cloud Platform | Cloud services |
| Google Cloud Storage | Raw file storage |
| Google BigQuery | Analytical data warehouse |
| Google IAM | Authentication and permissions |
| Docker | Containerised Airflow environment |

---

# Pipeline Workflow

The pipeline performs the following tasks:

### Step 1 – Infrastructure Deployment

Terraform provisions:

- Google Cloud Storage Bucket
- BigQuery Dataset
- BigQuery Table
- IAM Roles
- Service Account

Infrastructure only needs to be deployed once unless changes are made.

---

### Step 2 – Airflow Starts

The project runs inside an Astronomer-managed Airflow environment.

```
astro dev start
```

---

### Step 3 – Upload File to GCS

The Airflow DAG uses:

```
LocalFilesystemToGCSOperator
```

to upload the CSV file located inside

```
dags/data/
```

into the configured Google Cloud Storage bucket.

---

### Step 4 – Load Data into BigQuery

The uploaded file is loaded into BigQuery using

```
GCSToBigQueryOperator
```

The destination table is automatically populated and becomes immediately available for querying.

---

### Step 5 – Data Analysis

The data stored inside BigQuery can now be queried using:

- SQL
- Looker Studio
- Power BI
- Tableau
- Other BI tools

---

# Prerequisites

Before running the project ensure you have installed:

- Python 3.x
- Docker Desktop
- Astronomer CLI
- Terraform
- Google Cloud SDK
- Git

You will also need:

- A Google Cloud Project
- Billing enabled
- BigQuery API enabled
- Cloud Storage API enabled

---

# Authentication

Login using Google Cloud SDK

```bash
gcloud auth application-default login
```

Locate your generated credentials file.

Example:

```
C:\Users\username\AppData\Roaming\gcloud\application_default_credentials.json
```

Copy this file into the project data folder if required.

Create a `.env` file

```bash
cp .env.example .env
```

Update the environment variable:

```
GOOGLE_APPLICATION_CREDENTIALS=<path_to_credentials>
```

---

# Deploy Infrastructure

Navigate into Terraform

```bash
cd terraform
```

Initialise Terraform

```bash
terraform init
```

Preview resources

```bash
terraform plan
```

Deploy infrastructure

```bash
terraform apply -auto-approve
```

Terraform creates all required Google Cloud resources automatically.

---

# Start Airflow

Return to the project root

```bash
cd ..
```

Start Astronomer

```bash
astro dev start
```

Airflow will be available at

```
http://localhost:8080
```

Default credentials

```
Username: admin

Password: admin
```

---

# Configure Airflow Connection

Inside Airflow

```
Admin
    ↓
Connections
    ↓
Add Connection
```

Create a new connection

| Field | Value |
|---------|---------|
| Connection ID | google_cloud_default |
| Connection Type | Google Cloud |

Under **Extra** add your:

- Project ID
- Service Account Email

Save the connection.

---

# Run the Pipeline

Navigate to

```
DAGs
```

Locate your DAG.

Enable it.

Click

```
Trigger DAG
```

Monitor each task until all tasks complete successfully.

---

# Verify Results

Open Google BigQuery.

Navigate to your dataset.

Confirm that the destination table contains all rows from the CSV file located inside

```
dags/data
```

---

# Stop Airflow

```bash
astro dev stop
```

---

# Destroy Infrastructure

When the project is no longer required, remove all cloud resources.

```bash
cd terraform

terraform destroy -auto-approve
```

---

# Future Improvements

Potential enhancements include:

- Incremental loading instead of full refreshes
- Automatic schema detection
- Data quality validation using Great Expectations
- Cloud Composer deployment
- CI/CD pipeline using GitHub Actions
- Logging and monitoring with Cloud Logging
- Email notifications for pipeline failures
- Data transformation using dbt
- Support for multiple file formats such as JSON and Parquet

---

# Learning Outcomes

This project demonstrates practical experience with:

- Infrastructure as Code (Terraform)
- Google Cloud Platform
- Apache Airflow
- Workflow orchestration
- Cloud Storage
- BigQuery
- Docker
- Python
- IAM permissions
- End-to-end ETL pipeline development

It serves as a beginner-friendly cloud data engineering project while following many of the concepts used in production-grade data pipelines.