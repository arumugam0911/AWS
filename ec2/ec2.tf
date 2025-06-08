# EC2 instance resource
resource "aws_instance" "terraform_ec2" {
  ami             = var.ami
  key_name        = var.keypair
  instance_type   = var.instance_type
  security_groups = [var.linux_security_group]
  tags = {
    Name  = var.instance_name
    Env   = "dev"
  }
}
