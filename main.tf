terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}
provider "google" {

  project = "protean-torus-407002"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "random_id" "bucket_id" {
  byte_length = 8
}

resource "google_storage_bucket" "name" {
    name = "economic-data-${random_id.bucket_id.hex}"
    location = "US"
    storage_class = "COLDLINE"

    cors {
    origin          = ["https://localhost:8080"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
  
}