locals{
  environmenname ="${var.ProjectName}-${var.environment}"
}

resource "aws_instance" "LinuxServerEC2" {
     
        ami =var.ami
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