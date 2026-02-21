resource "google_service_account" "terraform" {
  project = var.project_id
  account_id   = "terraform-${var.env}"
  display_name = "Terraform Service Account"
}

resource "google_service_account" "microservice" {
  project = var.project_id
  count        = length(var.microservice_names)
  account_id   = "${var.microservice_names[count.index]}-sa-${var.env}"
  display_name = "Service Account for ${var.microservice_names[count.index]} in ${var.env}"
}

output "terraform_sa_email" {
  value = google_service_account.terraform.email
}

output "microservice_sa_emails" {
  value = google_service_account.microservice[*].email
}
