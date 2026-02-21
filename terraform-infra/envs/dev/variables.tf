variable "env" { default = "dev" }
variable "project_id" { default = "motocorp-simon" }
variable "region" { default = "us-central1" }

variable "vpc_name" { default = "microservices-vpc-dev" }

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "microservice_names" {
  default = ["appointment-service", "order-service", "patient-service"]
}