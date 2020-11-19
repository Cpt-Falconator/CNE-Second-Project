provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "EC2" {
  source = "./Modules/EC2"

  public_key = var.public_key
  region     = var.region
  ami        = var.ami
  type       = var.type

  VPC_SG_id     = module.VPC.VPC_SG_id
  VPC_Subnet_id = module.VPC.VPC_Subnet_id
}

module "VPC" {
  source = "./Modules/VPC"
}