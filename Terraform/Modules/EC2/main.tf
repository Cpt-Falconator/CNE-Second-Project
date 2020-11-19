resource "aws_key_pair" "testing_EC2" {
  key_name   = "task_setup_key.pub"
  public_key = var.public_key
}

resource "aws_instance" "JenkinsMachine" {
    availability_zone = "eu-west-1b"
    ami = var.ami
    instance_type = var.type
    security_groups   = [var.VPC_SG_id]
    subnet_id    = var.VPC_Subnet_id
    key_name = aws_key_pair.testing_EC2.key_name

    provisioner "local-exec" {
    command = "echo '*Run Ansible Here*'"
    }

    provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      password    = ""
      private_key = file("/home/ubuntu/.ssh/task_setup_key")
      host        = "${self.public_ip}"
    }

    inline = [
      "sudo apt update",
      "echo 'Hacker voice *Im in*'",
      "ip addr show"
    ]
  }

    tags = {
    "Name" : "Second Project JenkinsVM"
    "Project" : "Second"
  }
}