
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

  variable "region" {
  description = "Giving the AWS Region"
  type	= string
  default = "ap-south-1"
}

 variable "key_name" {
  description = "Giving the Key_Name"
  type	= string
  default = "SivaPemFile"
}


 variable "instance_name" {
  description = "hilight the instance name"
  type	= string
  default = "AWS Training"
}