resource "aws_vpc" "demo-vpc"{
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"
    
    tags = {
        Name = "demo-vpc"
    }
}

resource "aws_subnet" "public-subnet-1" {
    vpc_id = "${aws_vpc.demp-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //it makes this a public subnet
    availability_zone = "${var.AWS_AZONE}"
    
    tags = {
        Name = "public-subnet-1"
    }
}

resource "aws_subnet" "private-subnet-1" {
    vpc_id = "${aws_vpc.demo-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false" //it makes this a public subnet
    availability_zone = "${var.AWS_AZONE}"
    
    tags = {
        Name = "private-subnet-1"
    }
}
