resource "aws_instance" "JenkinsMachine" {
    ami = var.ami
    instance_type = var.type
}