resource "aws_security_group_rule" "rule" {
  type            = "${var.type}"
  from_port       = "${var.from}"
  to_port         = "${var.to}"
  protocol        = "${var.protocol}"
  cidr_blocks     = "${var.cidr}"
  security_group_id = "${var.sgId}"
  description       = "${var.description}"
}