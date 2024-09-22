locals{
  environmenname ="${var.ProjectName}-${var.environment}"
}



terraform {
  backend "s3" {
    bucket         = "mystatefilebucket244"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
   
  }
}

resource "aws_instance" "LinuxServerEC2" {
        count = 2
        ami =var.ami
        instance_type = var.instancetype
        key_name = "SivaPem" 
        
        subnet_id = var.Subnet
        vpc_security_group_ids = [var.SecurityGroup]
 
    tags = {
        Name = "AWS Training ${count.index}"


         }
}



provider "aws" {
  region = "ap-south-1"
}