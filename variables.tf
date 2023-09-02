variable "ami" {
  type    = string
  default = "#AMI_OF_UBUNTU"
}

variable "infra_env" {
  default = "YOUR_ENV"
}

variable "instace_type" {
  type    = string
  default = "t3.medium"
}

variable "keyname" {
  type    = string
  default = "YOUR_KEY_NAME"
}

variable "vpc_cidr" {
  type    = string
  default = "VPC_CIDR"
}

variable "public_subnets" {
  type    = list(any)
  default = ["subnet-XX1", "subnet-XX2", "subnet-XX3"]
}

variable "private_subnets" {
  type    = list(any)
  default = ["subnet-XX1", "subnet-XX2", "subnet-XX3"]
}

variable "azs" {
  type    = list(any)
  default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "vpc_id" {
  type    = string
  default = "vpc-XX"
}

variable "alb_sg" {
  default = "sg-XX"
}

variable "instance_name" {
  default = "jenkins"
}