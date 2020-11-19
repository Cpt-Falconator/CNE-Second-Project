provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

module "EC2" {
  source = "./Modules/EC2"

  region      = var.region
  ami         = var.ami
  type        = var.type
}