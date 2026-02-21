module "network" {
  source               = "../../modules/network"
  project_id           = var.project_id
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  region               = var.region
  env                  = var.env
}

module "iam" {
  source             = "../../modules/iam"
  project_id           = var.project_id
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
  project_id      = var.project_id
  region          = var.region
  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets
}

module "artifact_registry" {
  source        = "../../modules/artifact_registry"
  project_id    = var.project_id
  env           = var.env
  region        = var.region
  repository_id = "appointment-service"   # example, can create 3 separate repos for 3 microservices
}
