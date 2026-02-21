# Environment name
variable "env" {
  default = "staging"
}

# Your actual GCP project ID
variable "project_id" {
  default = "motocorp-simon"   # <-- Replace with real project ID
}

# GCP region for all resources
variable "region" {
  default = "us-central1"            # <-- Change if needed
}

# VPC name
variable "vpc_name" {
  default = "microservices-vpc-staging"
}

# Public subnet CIDRs
variable "public_subnet_cidrs" {
  default = ["10.1.1.0/24", "10.1.2.0/24"]
}

# Private subnet CIDRs
variable "private_subnet_cidrs" {
  default = ["10.1.101.0/24", "10.1.102.0/24"]
}

# Microservices list
variable "microservice_names" {
  default = ["appointment-service", "order-service", "patient-service"]
}
