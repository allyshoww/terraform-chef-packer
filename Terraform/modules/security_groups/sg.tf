resource "aws_security_group" "sg" {
  name        = "${var.sgName}"
  description = "${var.description}"
  vpc_id      = "${var.vpcId}"

  tags {
    Name        = "${var.tagName}"
    Department    = "${var.tagDepartment}"    
    Stack = "${var.tagStack}"
  }
}
output "id" {
  value = "${aws_security_group.sg.id}"
}
