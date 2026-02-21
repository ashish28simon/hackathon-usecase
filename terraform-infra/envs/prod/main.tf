# Network Module
module "network" {
  source               = "../../modules/network"
  vpc_name             = var.vpc_name
  project_id           = var.project_id
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
  env                  = var.env
}

# IAM Module
module "iam" {
  source             = "../../modules/iam"
  project_id           = var.project_id
  env                = var.env
  microservice_names = var.microservice_names
}

# Storage Module (Terraform state bucket)
module "storage" {
  source     = "../../modules/storage"
  env        = var.env
  region     = var.region
  project_id = var.project_id
}

# GKE Cluster Module
module "gke" {
  source          = "../../modules/gke"
  project_id      = var.project_id
  env             = var.env
  region          = var.region
  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets
}

# Artifact Registry Module (Docker images)
module "artifact_registry" {
  source = "../../modules/artifact_registry"
  project_id = var.project_id
  repository_id = "prod-docker-repo"
  env    = var.env
  region = var.region
}
