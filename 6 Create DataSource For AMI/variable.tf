
variable "Subnet" {
  description = "assigning the Subnet ID"
  type = string
  default = "subnet-05d98b2a60ee9673f"
  }


  
variable "SecurityGroup" {
  description = "assigning the SecurityGroup ID"
  type = string
  default = "sg-05a3ca892ee16a933"
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

  variable "ProjectName" {
  description = "Name of Project"
  type = string
  default = "AWS Training Project"
  }

    variable "environment" {
  description = "environment"
  type = string
  default = "Prod"
  }


