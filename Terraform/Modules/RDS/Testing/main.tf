resource "aws_db_instance" "TestingDB" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "TestingDB"
  username             = "FalconTest"
  password             = "MWAMDATABASE"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = var.DB_Subnet_Name

}

