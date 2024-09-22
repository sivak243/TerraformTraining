

data "aws_ami" "ec2ami" {
  //executable_users = ["self"]
  most_recent      = true
  //owners           = ["137112412989"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10*"]
    

  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

