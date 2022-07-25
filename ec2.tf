resource "aws_instance" "bastion" {
    ami = "${lookup(var.AMI, "ker510")}"
    instance_type = "t2.micro"
    subnet_id = "${aws_subnet.public-subnet.id}"
    vpc_security_group_ids = ["${aws_security_group.ssh-only.id}"]
    key_name = "${aws_key_pair.demo_key_pair.id}"
    
}

resource "aws_key_pair" "demo_key_pair" {
    key_name = "demo_key_pair.pub"
    public_key = "${file(var.KEY_PAIR)}"
}