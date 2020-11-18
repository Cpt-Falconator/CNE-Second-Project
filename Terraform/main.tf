module "EC2"
{
  source = "./EC2"

  environment = var.environment
  region = var.region
  ami = var.ami
  type = var.type
}