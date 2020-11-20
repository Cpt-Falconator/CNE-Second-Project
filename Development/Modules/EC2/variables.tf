variable "ami" {
    default = ""
}

variable "type" {
    default = ""
}

variable "region" {
    default = ""
}

variable "public_key"{
    default = ""
}

variable "VPC_SG_id" {
  description = "VPC Security Group"
  default     = ""
}

variable "VPC_Subnet_id" {
  description = "VPC Subnet"
  default = ""
}