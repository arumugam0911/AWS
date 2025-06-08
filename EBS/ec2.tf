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
# Create EBS Volume
resource "aws_ebs_volume" "additional_storage" {
  availability_zone = aws_instance.terraform_ec2.availability_zone  # Match your instance's AZ
  size              = 1            # Size in GB
  tags = {
    Name = "MyFirstEBSVolume"
  }
}
# attach additional EBS to EC2 instance
resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvdb"  # Use a valid device name for your OS
  volume_id   = aws_ebs_volume.additional_storage.id
  instance_id = aws_instance.terraform_ec2.id
}