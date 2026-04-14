provider "aws" {
  region = var.region
}

# Key Pair
resource "aws_key_pair" "terraform_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# Security Group
resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh_terraform"

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "my_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name = aws_key_pair.terraform_key.key_name

  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = var.instance_name
  }
}
