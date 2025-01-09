variable "vpcblock" {
  default = "10.0.0.0/20"
}

variable "vpcname" {
  default = "terraform-vpc"
}

variable "subnetblock1" {
  default = "10.0.1.0/24"
}

variable "subnet1" {
  default = "public_subnet1"
}

variable "subnetblock2" {
  default = "10.0.2.0/24"
}

variable "subnet2" {
  default = "public_subnet2"
}

variable "igw_name" {
  default = "MyInternetGateway"
}

variable "route_table" {
  default = "my_route_table"
}

variable "dest_cidr_block" {
  default = "0.0.0.0/0"
}
