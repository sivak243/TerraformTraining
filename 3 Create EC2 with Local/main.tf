locals{
  environmenname ="TEST123"
}

resource "aws_instance" "LinuxServerEC2" {
     
        ami =var.ami
        instance_type = var.instancetype
        key_name = "SivaPem" 
        
        subnet_id = var.Subnet
        vpc_security_group_ids = [var.SecurityGroup]
 
    tags = {
        /*Name = "AWS Training"*/
        Name = local.environmenname
     }
}


provider "aws" {
  region = "ap-south-1"
}


/* 
Local Variables: Use for temporary calculations, intermediate values, or complex expressions within a module.
Normal Variables: Use for values that need to be shared across multiple modules or for defining configuration parameters.

*/