resource "aws_instance" "Batch114EC2A" {
     
        ami ="ami-02eb7a4783e7e9317"
        instance_type = "t2.micro"
        key_name = "SivaPem" 
        
        subnet_id = "subnet-05d98b2a60ee9673f"

        vpc_security_group_ids = ["sg-05a3ca892ee16a933"]
  
    tags = {
        Name = "AWSTerrformTraining114_A"
         }
}





provider "aws" {
  region = "ap-south-1"
}