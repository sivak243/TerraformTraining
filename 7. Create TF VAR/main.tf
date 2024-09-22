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
     
        ami =data.aws_ami.ec2ami.id
        instance_type = var.instancetype
        key_name = "SivaPem" 
        
        subnet_id = var.Subnet
        vpc_security_group_ids = [var.SecurityGroup]
 
    tags = {
        Name = "AWS Training"
         }
}


provider "aws" {
  region = "ap-south-1"
}