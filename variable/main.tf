provider "aws" {
  region = "ap-south-1"
}

variable "vpcname" {
  type    = string
  default = "terravpc"
}

variable "sshport" {
  type    = number
  default = 22
}

variable "enabled" {
  default = true
}

variable "mylist" {
  type    = list(string)
  default = ["v1", "v2"]
}

variable "mymap" {
  type = map(any)
  default = {
    Key1 = "v1"
    Key2 = "v2"
  }
}

variable "inputname" {
  type        = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.inputname

  }
}

output "vpcid" {
    value = aws_vpc.myvpc.id
}


