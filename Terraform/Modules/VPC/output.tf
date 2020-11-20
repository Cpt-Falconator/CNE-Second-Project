output "VPC_SG_id" {
  value = aws_security_group.Project_Jenkins_SG.id
}

output "VPC_PubSub_id" {
  value = aws_subnet.Pub_Sub.id
}

output "VPC_PriSub_id" {
  value = aws_subnet.Pri_Sub.id
}

output "DB_Subnet_Name" {
  value = aws_db_subnet_group.DB_Subnet.name
}