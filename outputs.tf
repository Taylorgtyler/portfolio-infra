output "bucket_name" {
  value = google_storage_bucket.name.name
  description = "Name of the gdp bucket"
}