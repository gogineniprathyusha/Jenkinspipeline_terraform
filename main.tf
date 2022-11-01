# Configure the AWS provider

provider "aws" {
  profile = "default"
  region = "us-east-1"
}


resource "aws_instance" "jenkinspipeline_terraform" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "Devops"
  associate_public_ip_address = true
  user_data                   = file("softwareinstall.sh")
  tags = {
    Name = "jenkinspipeline_terraform"
  }
}
