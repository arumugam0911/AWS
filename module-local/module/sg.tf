resource "aws_security_group" "module_security_group" {
  name        = var.module_security_group
  description = "Allow SSH HTTP ICMP"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  ingress {
    description = "ICMP"
    from_port   = 0 #indicates all ports.
    to_port     = 0 #indicates all ports.
    protocol    = "ICMP"
    cidr_blocks = var.cidr
  }

  egress {
    description = "ALL TRAFFIC"
    from_port   = 0 #indicates all ports.
    to_port     = 0 #indicates all ports.
    protocol    = "-1" # Protocol '-1' allows all protocols (TCP, UDP, ICMP, etc.)
    cidr_blocks = var.cidr
  }

  tags = {
    Name = var.module_security_group
  }
}