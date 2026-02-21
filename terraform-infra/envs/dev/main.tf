module "network" {
  source               = "../../modules/network"
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
  env                  = var.env
}

module "iam" {
  source             = "../../modules/iam"
  env                = var.env
  microservice_names = var.microservice_names
}

module "storage" {
  source     = "../../modules/storage"
  env        = var.env
  region     = var.region
  project_id = var.project_id
}

module "gke" {
  source          = "../../modules/gke"
  env             = var.env
  region          = var.region
  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets
}

module "artifact_registry" {
  source = "../../modules/artifact_registry"
  env    = var.env
  region = var.region
}