# Environment name
variable "env" {
  default = "prod"
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
  default = "microservices-vpc-prod"
}

# Public subnet CIDRs
variable "public_subnet_cidrs" {
  default = ["10.2.1.0/24", "10.2.2.0/24"]
}

# Private subnet CIDRs
variable "private_subnet_cidrs" {
  default = ["10.2.101.0/24", "10.2.102.0/24"]
}

# Microservices list
variable "microservice_names" {
  default = ["appointment-service", "order-service", "patient-service"]
}