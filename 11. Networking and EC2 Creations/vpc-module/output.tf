
 
  output Output_VPCID {
  description = "this variable will have output vpc id"
  value =aws_vpc.my_vpc.id
  }

  output Output_GateWayID {
  description = "this variable will have output Gateway id"
  value =aws_internet_gateway.gw.id
  }


