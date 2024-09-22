output OutputInstance_public_ip{
  description = "Public IP of AWS EC2 Instance"
  value =resource.aws_instance.LinuxServerEC2[*].public_ip
  }
  