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
  credentials = file("<NAME>.json")

  project = "protean-torus-407002"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_storage_bucket" "name" {
    name = "economic-data-${random_id.bucket_id.hex}"
    location = "US"
    force_destroy = true

    cors {
    origin          = ["http://example.com"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }
  
}

output "bucket_name" {
  value = google_storage_bucket.name.name
  description = "The name of the bucket"
}