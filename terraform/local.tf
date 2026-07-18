locals {
  table_schema = jsonencode([
    {
      name        = "employee_id"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Unique identifier for individual employee"
    },
    {
      name        = "first_name"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Employees' first name"
    },
    {
      name        = "last_name"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "EMployees' last name"
    },
    {
      name        = "gender"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Employees' gender"
    },
    {
      name        = "age"
      type        = "INTEGER"
      mode        = "NULLABLE"
      description = "Age of the employees"
    },
    {
      name        = "department"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Employees' department"
    },
    {
      name        = "job_title"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Employees' Job Title"
    },
    {
      name        = "location"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Office location of the employee"
    },
    {
      name        = "employment_type"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Type of employees contract"
    },
    {
      name        = "salary"
      type        = "INTEGER"
      mode        = "NULLABLE"
      description = "Employees' Salary"
    },
    {
      name        = "hire_date"
      type        = "DATE"
      mode        = "NULLABLE"
      description = "Employees' Start Date"
    },
    {
      name        = "email"
      type        = "STRING"
      mode        = "NULLABLE"
      description = "Employees' email address"
    }
  ])
}