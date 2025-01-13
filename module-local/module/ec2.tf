# EC2 instance resource
resource "aws_instance" "module-ec2" {
  ami             = var.amiid
  key_name        = var.keypair
  instance_type   = var.instance_type
  security_groups = [var.module_security_group]
  tags = {
    Name  = var.instance_name
    Env   = var.env
  }
}
