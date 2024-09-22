
resource "aws_instance" "LinuxServerEC2" {
    count= 1
    
        ami =data.aws_ami.ec2ami.id
        instance_type = "t2.micro"
        
     // subnet_id = resource.aws_subnet.my_PrivateSubnet.id
        subnet_id = resource.aws_subnet.my_PublicSubnet.id

        user_data = file("script.sh")
    tags = {
        Name = format("%s_%s",var.instance_name,count.index)
      
   }
}

resource "aws_subnet" "my_PublicSubnet" {
   vpc_id=var.VPC_ID
   cidr_block        = var.subnet1_cidr_block
  availability_zone = "us-east-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "PublicSubnet_T"
  }
}

resource "aws_subnet" "my_PrivateSubnet" {
  vpc_id=var.VPC_ID
  cidr_block        = var.private_cidr_block
  availability_zone = "us-east-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "PrivateSubnet_T"
  }
}



resource "aws_route_table" "PublicRouteTable1" {
  //vpc_id = "{module.aws_vpc.my_vpc.id}"
  vpc_id=var.VPC_ID
  

  route {
    cidr_block = var.OpenIP
    gateway_id =var.igw1_ID
  }
  
  tags = {
    Name = "PublicRT_T"
  }
}

resource "aws_route_table_association" "RouteAssociation" {
  subnet_id      = aws_subnet.my_PublicSubnet.id
  route_table_id = aws_route_table.PublicRouteTable1.id
}


locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 80
      description = "Ingree rules for port 80"
   },
     {
      port        = 22
      description = "Ingree rules for port 22"
     }
   
   ]
}


resource "aws_security_group" "allow_http" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id=var.VPC_ID

  /*
  
  I am trying to make this block dynamic as below.

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }*/

   dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]

      }
   }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http"
  }
}



resource "aws_network_interface_sg_attachment" "sg_attachment" {
  count =length(aws_instance.LinuxServerEC2)
  security_group_id    = aws_security_group.allow_http.id
  network_interface_id = aws_instance.LinuxServerEC2[count.index].primary_network_interface_id
  
  
}
