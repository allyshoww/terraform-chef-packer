resource "aws_vpc" "main" {
	cidr_block  = "${var.cidr}"
	enable_dns_hostnames = "${var.dns_hostnames}"
	enable_dns_support	= "${var.dns_support}"

	tags {
    Name        = "${var.tagName}"
    Department  = "${var.tagDepartment}"
    Stack       = "${var.tagStack}"
  }

}

output "id" {
  value = "${aws_vpc.main.id}"
}