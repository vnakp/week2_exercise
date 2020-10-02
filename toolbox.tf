provider "aws" {
  region = var.region

  profile = "default"
}
terraform {
  backend "s3" {
    bucket = "week2-tool-box"
    key    = "week2.tfstate"
    region = "eu-west-1"
  }
}
resource "aws_instance" "toolserver" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.sec_grp2.id]

  tags = {
    Name        = "toolserver"
    Provisioner = "Terraform"
  }
}

resource "aws_instance" "toolbox" {
  ami                    = "ami-06fd8a495a537da8b"
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.sec_grp2.id]

  tags = {
    Name        = "toolbox1"
    Provisioner = "Terraform"
  }
}

resource "aws_instance" "toolbox2" {
  ami                    = "ami-06fd8a495a537da8b"
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.sec_grp.id]

  tags = {
    Name        = "toolbox2"
    Provisioner = "Terraform"
  }
}