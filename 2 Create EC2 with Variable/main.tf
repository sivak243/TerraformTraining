resource "aws_instance" "LinuxServerEC2" {
     
        ami =var.ami
        instance_type = var.instancetype
        
        key_name = var.key_name
        
        subnet_id = var.Subnet
        vpc_security_group_ids = [var.SecurityGroup]
      

  
    tags = {
        Name = var.instance_name
         }
}


provider "aws" {
  region = var.region
}