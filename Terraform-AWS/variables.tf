##General vars
variable "ssh_user" {
  default = "ubuntu"
}
##AWS Specific Vars
variable "aws_access_key" {
  default = "AKIA***LKJZ***PN5A"
}
variable "aws_secret_key"  {
  default = "cCVq***wQd4Gg****ZMUM5uA7Qk******PvXt0"
}
variable "aws_security_group" {
  default = "ITsw_sg"
}
variable "aws_worker_count" {
  default = 1
}
variable "aws_key_name" {
  default = "IhorTkey"
}
variable "key_path" {
  default = "/home/tihor/myapps/terra/"
}
variable "aws_instance_size" {
  default = "t2.micro"
}
variable "aws_region" {
  default = "eu-west-1"
}
variable "aws_vpc_id" {
default = "vpc-b8daecde"
}
