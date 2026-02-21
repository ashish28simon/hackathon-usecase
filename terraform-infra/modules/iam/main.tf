resource "google_service_account" "terraform" {
  account_id   = "terraform-sa-${var.env}"
  display_name = "Terraform Service Account for ${var.env}"
}

resource "google_service_account" "microservice" {
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