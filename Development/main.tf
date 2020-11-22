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
  VPC_Subnet_id = module.VPC.VPC_PubSub_id

  depends_on = [
    module.VPC
  ]
}

module "VPC" {
  source = "./Modules/VPC"
}

module "RDS-Deployment" {
  source = "./Modules/RDS/Deployment"

  VPC_SG_id      = module.VPC.VPC_SG_id
  DB_Subnet_Name = module.VPC.DB_Subnet_Name

}

module "RDS-Testing" {
  source = "./Modules/RDS/Testing"

  VPC_SG_id      = module.VPC.VPC_SG_id
  DB_Subnet_Name = module.VPC.DB_Subnet_Name
}

module "EKS" {
  source = "./Modules/EKS"

  SG_id      = module.VPC.VPC_SG_id
  Pub_Sub_id = module.VPC.VPC_PubSub_id
  Pri_Sub_id = module.VPC.VPC_PriSub_id
  Node_Subnet_ids = [module.VPC.VPC_PubSub_id,module.VPC.VPC_PriSub_id]
}