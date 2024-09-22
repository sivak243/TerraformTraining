

resource "aws_instance" "LinuxServerEC2" {
   
        ami ="ami-02eb7a4783e7e9317"
        instance_type = "t2.micro"
        key_name = "SivaPem" 
        
        subnet_id = "subnet-05d98b2a60ee9673f"
    
        vpc_security_group_ids = [var.NewSecurityGrp]
      
       
    tags = {
         Name = "Module Testing"
  
     }
}

