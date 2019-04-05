provider "aws" {
    access_key = "${var.accessKey}"
    secret_key = "${var.secretKey}"    
    region   = "${var.awsRegion}"
}

module "main-vpc" {
    source = "./modules/vpc/"
    cidr = "172.30.0.0/16"
    dns_hostnames = "true"
    dns_support = "true"
    tagName = "MAIN_VPC"
    tagDepartment = "TECH"
    tagStack = "DEV"
}
module "public-subnet" {
    source = "./modules/subnets/"
    vpcId  = "${module.main-vpc.id}"
    cidr = "172.30.100.0/24"
    az = "${var.awsRegion}a"
    public = "true"
    tagName = "PUBLIC_SUBNET"
    tagDepartment = "TECH"
    tagStack = "DEV"
}
module "remote-access-sg" {
    source = "./modules/security_groups/"
    sgName = "SSH-SG"
    description = "Security Group to remote access rules"
    vpcId  = "${module.main-vpc.id}"
    tagName = "SSH"
    tagDepartment = "TECH"
    tagStack = "DEV"
}

module "remote-acess-sgrule-1" {
    source = "./modules/security_groups/cidrRules/"
    type = "ingress"
    from = "22"
    to = "22"
    protocol = "tcp"
    cidr = ["0.0.0.0/0"]
    sgId = "${module.remote-access-sg.id}"
    description = "Port 22 ingress rules"
}

module "key-pair" {
    source = "./modules/key_pair/"
    keyPairName = "myKeyPair"
    publicKeyPath = "./ssh_key/id_rsa.pub"
}

module "instance" {
    source = "./modules/instance/"
    ami = "${var.amis}"
    type = "t2.small"
    secGroups = ["${module.remote-access-sg.id}"]
    subnetId = "${module.public-subnet.id}"
    sshKey = "myKeyPair"
    public_ip = "true"
    tagName = "myInstance"
    tagDepartment = "TECH"
    tagStack = "DEV"
}