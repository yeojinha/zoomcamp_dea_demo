terraform {
  required_providers {
    google = {
      source   = "hashicorp/google"
      version = "5.6.0"
    }
  }
}

provider "google" {
  credentials ="./keys/my-creds.json"
  project = "cogent-metric-434206-h9"
  region  = "asia-northeast1"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "cogent-metric-434206-h9-terra-bucket"
  location      = "asia-northeast1"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}