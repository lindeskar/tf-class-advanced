variable "bucket_name_prefix" {
  type = string
}

variable "bucket_location" {
  type = string
}

resource "random_string" "myrandom" {
  length  = 16
  upper   = false
  special = false
}

resource "google_storage_bucket" "e01" {
  name          = "${var.bucket_name_prefix}${random_string.myrandom.id}"
  location      = var.bucket_location
  force_destroy = true
}

output "bucket_name" {
  value = google_storage_bucket.e01.name
}
