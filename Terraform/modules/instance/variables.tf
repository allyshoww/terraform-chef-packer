variable "secGroups" { type = "list"}
variable "subnetId" {}
variable "ami" {}
variable "type" {
  default = "t2.micro"
}
variable "public_ip" {
  default = "false"
}
variable "sshKey" {
  
}


  variable "tagName" {}
variable "tagDepartment" {}
variable "tagStack" {}