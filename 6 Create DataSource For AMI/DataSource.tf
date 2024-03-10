

data "aws_ami" "ec2ami" {
  //executable_users = ["self"]
  //most_recent      = true
  //owners           = ["137112412989"]
  most_recent = true
  //owners = ["self"]

  filter {
    name   = "name"
    //values = ["amzn2-ami-kernel-5.10-hvm-2.0.20220805.0-x86_64-gp2"]
    values = ["amzn2-ami-kernel-5.1*"]

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

