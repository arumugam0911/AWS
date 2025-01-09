variable "keypair" {
  default = "ec2_keypair"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "linux_security_group"{
  default = "linux_SG"
}
variable "instance_name"{
  default = "terraform_ec2"
}