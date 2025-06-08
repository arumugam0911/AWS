# Create a VPC 
resource "aws_vpc" "terraform-vpc" {
  cidr_block           =  var.vpcblock
  tags = {
    Name = var.vpcname
  }
}

# Create a public subnet1
resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.subnetblock1
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"  # Adjust to your region
  tags = {
    Name = var.subnet1
  }
}

# Create a public subnet2
resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.subnetblock2
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"  # Adjust to your region
  tags = {
    Name = var.subnet2
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.terraform-vpc.id
  tags = {
    Name = var.igw_name
  }
}

# Create a explicit route table for the public subnet
#resource "aws_route_table" "my_route_table" {
#  vpc_id = aws_vpc.terraform-vpc.id
#
#  route {
#    cidr_block = var.dest_cidr_block
#    gateway_id             = aws_internet_gateway.igw.id
#  }
#  tags = {
#    Name = var.route_table
#  }
#}

# Associate the default route table with the internet gateway
resource "aws_main_route_table_association" "default_route" {
  vpc_id         = aws_vpc.terraform-vpc.id
  route_table_id = aws_vpc.terraform-vpc.default_route_table_id
}
# Add a route to the internet gateway in the default route table
resource "aws_route" "default_internet_route" {
  route_table_id         = aws_vpc.terraform-vpc.default_route_table_id
  destination_cidr_block = var.dest_cidr_block
  gateway_id             = aws_internet_gateway.igw.id
}


# Associate the route table with the public subnet1
#resource "aws_route_table_association" "public_route_table_assoc1" {
#  subnet_id      = aws_subnet.public_subnet1.id
#  route_table_id = aws_route_table.my_route_table.id
#}

# Associate the route table with the public subnet2
#resource "aws_route_table_association" "public_route_table_assoc2" {
#  subnet_id      = aws_subnet.public_subnet2.id
#  route_table_id = aws_route_table.my_route_table.id
#}
