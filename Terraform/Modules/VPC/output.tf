output "VPC_SG_id" {
  value = aws_security_group.Project_Jenkins_SG.id
}

output "VPC_Subnet_id" {
  value = aws_subnet.Pub_Sub.id
}