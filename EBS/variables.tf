variable "ami" {
  default ="ami-02457590d33d576c3"  
}

variable "keypair" {
  default = "ec2_keypair"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "linux_security_group"{
  default = "linux-sg"
}
variable "instance_name"{
  default = "terraform_ec2"
}