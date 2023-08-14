locals{
  environmenname ="${terraform.workspace}"
}



terraform {
  backend "s3" {
    bucket         = "mystatefilebucket243"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
   
  }
}

resource "aws_instance" "LinuxServerEC2" {
     
        ami =data.aws_ami.ec2ami.id
        instance_type = var.instancetype
        key_name = "SivaPemFile" 
        
        subnet_id = var.Subnet
        vpc_security_group_ids = [var.SecurityGroup]
 
    tags = {
        Name = local.environmenname
         }
}


provider "aws" {
  region = "ap-south-1"
}