terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.34.0"
    }
  }

}

provider "google" {
    # Configuration details
  project     = "full-project-502813"
  region      = "europe-west2"
}