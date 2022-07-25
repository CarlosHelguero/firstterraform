resource "aws_internet_gateway" "demo-igw" {
    vpc_id = "${aws_vpc.demo-vpc.id}"
    tags = {
        Name = "demo-igw"
    }
}
resource "aws_route_table" "demo-public-crt" {
    vpc_id = "${aws_vpc.demo-vpc.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.demo-igw.id}"
    }
    tags = {
        Name = "demo-public-crt"
    }
}

resource "aws_route_table_association" "demo-crta-public-subnet-1" {
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.demo-public-crt.id}"

}

resource "aws_security_group" "ssh-only" { 
    name        = "SG bastion"
    description = "Allow ssh nbound traffic"
    vpc_id      = aws_vpc.demo-vpc.id

    ingress {
        description     = "ssh only"
        from_port       = 22
        to_port         = 22 
        protocol        = "ssh" 
        }

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}

