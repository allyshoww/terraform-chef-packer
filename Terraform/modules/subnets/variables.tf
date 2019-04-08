variable "vpcId" {}
variable "cidr" {
    default = "172.31.100.0/24"
}
variable "public" {
    default = "false"
}
variable "az" {}

variable "tagName" {}
variable "tagDepartment" {}
variable "tagStack" {}