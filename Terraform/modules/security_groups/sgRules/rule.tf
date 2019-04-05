variable "type" {}
variable "from" {}
variable "to" {}
variable "protocol" {}
variable "sg" {}
variable "sgId" {}variable "description" {}


resource "aws_security_group_rule" "rule" {
  type            = "${var.type}"
  from_port       = "${var.from}"
  to_port         = "${var.to}"
  protocol        = "${var.protocol}"
  source_security_group_id = "${var.sg}"
  security_group_id = "${var.sgId}"
  description       = "${var.description}"
}