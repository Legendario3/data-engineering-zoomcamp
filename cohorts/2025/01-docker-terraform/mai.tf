terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.15.0"
    }
  }
}

provider "google" {
  credentials = "./dezoomcamp.json"
  project     = "dezoomcamp-447518"
  region      = "us-east1"
}

resource "google_storage_bucket" "dezoomcamp-bucket" {
  name          = "dezoomcamp-447518-dezoomcamp-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}