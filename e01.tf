# Create bucket using regular resource blocks

resource "random_string" "myrandom" {
  length  = 16
  upper   = false
  special = false
}

resource "google_storage_bucket" "website_gcs" {
  name          = "mybucket${random_string.myrandom.id}"
  location      = var.google_region
  force_destroy = true
}

output "google_storage_bucket_name" {
  value       = google_storage_bucket.website_gcs.name
  description = "Google Storage Bucket Name"
}

# Refactor into a module without changing the bucket
