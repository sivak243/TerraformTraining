resource "aws_instance" "LinuxServerEC2" {
     
        ami ="ami-02eb7a4783e7e9317"
        instance_type = "t2.micro"  /* This is the instance Type */
        key_name = "SivaPemFile" 
        
        subnet_id = "subnet-05d1ae82f96d631ec"

        vpc_security_group_ids = ["sg-0853e1b5ea4c8656b"]
  
    tags = {
        Name = "Module Testing"
         }
}


provider "aws" {
  region = "ap-south-1"
}