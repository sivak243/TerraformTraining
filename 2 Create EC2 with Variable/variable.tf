
variable "Subnet" {
  description = "assigning the Subnet ID"
  type = string
  default = "subnet-05d1ae82f96d631ec"
  }


  
variable "SecurityGroup" {
  description = "assigning the SecurityGroup ID"
  type = string
  default = "sg-04681fb5861e854ec"
  }

  variable "instancetype" {
  description = "assigning instance type"
  type = string
  default = "t2.micro"
  }

  variable "ami" {
  description = "assigning ami"
  type = string
  default = "ami-02eb7a4783e7e9317"
  }