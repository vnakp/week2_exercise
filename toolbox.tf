provider "aws" {
       region = var.region
       profile = "default"
    }
    terraform {
        backend  "s3" {
               bucket = "week2-tool-box"
               key = "week2.tfstate"
               region = "eu-west-1"
           }
    }
    resource "aws_instance" "toolserver" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key

   tags = {
       Name = "toolserver1"
    }
}