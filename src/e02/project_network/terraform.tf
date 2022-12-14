terraform {
  required_version = ">= 1.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.34"
    }
  }
}

provider "google" {
  project = var.google_project
  region  = var.google_region
}
