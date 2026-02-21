resource "google_storage_bucket" "terraform_state" {
  name          = "terraform-state-${var.env}-${var.project_id}"
  location      = var.region
  force_destroy = true

  versioning {
    enabled = true
  }
}

output "bucket_name" {
  value = google_storage_bucket.terraform_state.name
}