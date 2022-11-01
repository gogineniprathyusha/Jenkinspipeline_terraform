terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

# Configure the AWS provider

provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "jenkinspipeline_terraform" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Devops"
  subnet_id                   = aws_subnet.Tomcat-Subnet1.id
  associate_public_ip_address = true
  user_data                   = file("softwareinstall.sh")
  tags = {
    Name = "jenkinspipeline_terraform"
  }
}