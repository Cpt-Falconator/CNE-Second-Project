output "EC2_IPV4" {
  value = module.EC2.EC2_IPV4
}

output "D_DB_ENDPOINT" {
  value = module.RDS-Deployment.D_DB_ENDPOINT
}

output "T_DB_ENDPOINT" {
  value = module.RDS-Testing.T_DB_ENDPOINT
}