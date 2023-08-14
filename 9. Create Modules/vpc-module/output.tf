

  
  output Output_SecurityGroup {
  description = "this variable will have output vpc id"
  value =aws_security_group.allow_http.id
  }



