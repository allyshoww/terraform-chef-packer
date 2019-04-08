resource "aws_key_pair" "key_pair" {
  key_name = "${var.keyPairName}"
  public_key = "${file(var.publicKeyPath)}"
}
