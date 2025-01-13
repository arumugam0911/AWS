# Data block to fetch the latest Amazon Linux 2 AMI
data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = [var.amiid]
  }
}

# EC2 instance resource
resource "aws_instance" "terraform_ec2" {
  ami             = data.aws_ami.latest_ami.id
  key_name        = var.keypair
  instance_type   = var.instance_type
  security_groups = [var.linux_security_group]
  tags = {
    Name  = var.instance_name
    Env   = "dev"
  }
}
