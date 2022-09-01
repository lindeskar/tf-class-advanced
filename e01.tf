# Create bucket using regular resource blocks:

# resource "random_string" "myrandom" {
#   length  = 16
#   upper   = false
#   special = false
# }
#
# resource "google_storage_bucket" "website_gcs" {
#   name          = "mybucket${random_string.myrandom.id}"
#   location      = var.google_region
#   force_destroy = true
# }
#
# output "google_storage_bucket_name" {
#   value       = google_storage_bucket.website_gcs.name
#   description = "Google Storage Bucket Name"
# }

# Comment the above, and refactor into a module without changing the bucket:
module "e01_bucket" {
  source             = "./src/e01/modules/gcs_bucket"
  bucket_name_prefix = "mybucket"
  bucket_location    = var.google_region
}

output "google_storage_bucket_name" {
  value       = module.e01_bucket.bucket_name
  description = "Google Storage Bucket Name"
}

# Move state for existing random string and bucket:
moved {
  from = google_storage_bucket.website_gcs
  to   = module.e01_bucket.google_storage_bucket.e01
}

moved {
  from = random_string.myrandom
  to   = module.e01_bucket.random_string.myrandom
}
# Above is the same as running this in CLI:
# $ terraform state mv random_string.myrandom module.e01_bucket.random_string.myrandom
# $ terraform state mv google_storage_bucket.website_gcs module.e01_bucket.google_storage_bucket.e01
