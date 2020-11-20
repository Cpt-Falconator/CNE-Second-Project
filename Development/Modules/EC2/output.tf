output "EC2_IPV4" {
  value = aws_instance.JenkinsMachine.public_ip
}