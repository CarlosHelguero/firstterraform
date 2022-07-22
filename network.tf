resource "aws_internet_gateway" "demo-igw" {
    vpc_id = {aws_vpc.demo-vpc.id}
    tags = {
        Name = "demo-igw"
    }
}
resource "aws_public_route_table" "demo-public-crt" {
    vpc_id = {aws_vpc.demo-vpc.id}
    route = {
        cidr_block = "0.0.0.0/0"

        gateway_id = "${aws_internet_gateway.demo-igw.id}"
    }
    tags = {
        Name = demo-public-crt
    }
}

resource "aws_route_table_association" "demo-crta-public-subnet-1" {
    subnet_id = "${aws_subnet.public-subnet-1.id}"
    route_table_id = "${aws_route_table.demo-public-crt.id}"

}

resource "aws_public_security_group" "ssh only"{ 
    name        = "SG bastion"
    description = "Allow TLS inbound traffic"
    vpc_id      = aws_vpc.demo_vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        description     = "ssh only"
        from_port       = 22
        to port         = 22  
        }
}

