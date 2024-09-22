/*Creating a new VPC*/

resource "aws_vpc" "my_vpc" {
  cidr_block = var.private_cidr_block
  

  tags = {
    Name = var.vpc_name
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "mainIGW_T"
  }
}
