resource "aws_instance" "instance" {
        ami                     = "${var.ami}"
        instance_type           = "${var.type}"
        vpc_security_group_ids  = ["${var.secGroups}"]
        subnet_id               = "${var.subnetId}"
        key_name                = "${var.sshKey}"
        associate_public_ip_address = "${var.public_ip}"


  tags {
    Name        = "${var.tagName}"
    Department  = "${var.tagDepartment}"
    Stack       = "${var.tagStack}"
  }
}

output "id" {
  value = "${aws_instance.instance.id}"
}


