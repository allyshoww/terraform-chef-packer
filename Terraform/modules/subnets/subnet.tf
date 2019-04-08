resource "aws_subnet" "subnet" {
  vpc_id                  = "${var.vpcId}"
  cidr_block              = "${var.cidr}"
  map_public_ip_on_launch = "${var.public}"
  availability_zone       = "${var.az}"

  tags {
    Name        = "${var.tagName}"
    Department  = "${var.tagDepartment}"
    Stack       = "${var.tagStack}"
  }
}
output "id" {
  value = "${aws_subnet.subnet.id}"
}
