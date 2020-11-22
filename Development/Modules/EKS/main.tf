resource "aws_eks_cluster" "Development_EKS" {
  name     = "CNE_SIFA2_EKS"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = [var.Pub_Sub_id, var.Pri_Sub_id]
    security_group_ids = var.SG_id
  }

  tags = {
    Name = "CNE_SIFA2_EKS"
    Project = "Second"
  }
  version = "1.17"
}

resource "aws_eks_node_group" "node" {
  cluster_name    = aws_eks_cluster.Development_EKS.name
  node_group_name = "SIFA2 Nodes"
  node_role_arn   = var.node_arn
  subnet_ids      = [var.Pub_Sub_id, var.Pri_Sub_id]
  ami_type = var.ami_type
  instance_types = var.instance_types


  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
}