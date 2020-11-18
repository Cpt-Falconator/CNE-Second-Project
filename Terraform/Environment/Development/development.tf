variable "environment" {
}
variable "region" {
}
variable "access_key" {
}
variable "secret_key" {
}

provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

module "module" {
    source = "../../modules"
    environment = var.environment
    region = var.region
}