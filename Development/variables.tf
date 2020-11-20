variable "ami" {
  description = "machine image"
  default     = "ami-0dc8d444ee2a42d8a"
}

variable "type" {
  description = "vm type"
  default     = "t2.micro"
}

variable "region" {
  default = "eu-west-1"
}
variable "access_key" {
}
variable "secret_key" {
}

variable "public_key" {

}
